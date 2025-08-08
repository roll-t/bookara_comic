import 'dart:developer';
import 'dart:io';
import 'package:bookara/core/config/const/app_enum.dart';
import 'package:bookara/core/config/result.dart';
import 'package:bookara/core/services/dto/api_respon.dart';
import 'package:bookara/core/services/network/api_enpoint.dart';
import 'package:bookara/core/services/network/api_intercepter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient extends GetxService {
  late final Dio _dio;
  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initDio();
    _listenNetworkChange();
  }

  Dio get client => _dio;

  void _initDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(ApiInterceptor());

    log('[ApiClient] ✅ Dio initialized');
  }

  void _listenNetworkChange() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) async {
      if (results.isNotEmpty) {
        final online = await _checkNetwork();
        if (isConnected.value != online) {
          isConnected.value = online;
          if (!online) {
            _showSnackbar('Không có kết nối',
                'Vui lòng kiểm tra lại kết nối mạng.', Colors.redAccent);
          } else {
            _showSnackbar('Đã kết nối mạng',
                'Kết nối internet đã được khôi phục.', Colors.green);
          }
        }
      }
    });

    // Kiểm tra ngay khi khởi tạo
    Future.microtask(() async {
      isConnected.value = await _checkNetwork();
    });
  }

  Future<bool> _checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  void _showSnackbar(String title, String message, Color color) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: color,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  /// Wrapper GET request
  Future<Result<dynamic>> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    if (!isConnected.value) {
      return Result(
        status: Results.error,
        message: 'Không có kết nối internet',
      );
    }
    try {
      final response = await _dio.get(path, queryParameters: query);

      if (response.statusCode == 200) {
        final res = ApiRespon.fromJson(response.data);
        if (res.isSuccess) {
          return Result(
            status: Results.success,
            data: res.data,
          );
        } else {
          return Result(
            status: Results.error,
            message: res.message ?? 'Lỗi không xác định từ API',
          );
        }
      } else {
        return Result(
          status: Results.error,
          message: 'HTTP ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      return Result(
        status: Results.error,
        message: _handleError(e),
      );
    }
  }

  String _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Kết nối server quá thời gian cho phép';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Server phản hồi quá chậm';
    } else if (e.type == DioExceptionType.badResponse) {
      return 'Lỗi server: ${e.response?.statusCode}';
    } else {
      return 'Có lỗi xảy ra: ${e.message}';
    }
  }
}
