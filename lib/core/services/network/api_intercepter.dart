import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("➡️ [REQUEST] ${options.method} ${options.uri}");
    if (options.data != null) {
      debugPrint("📦 Body: ${options.data}");
    }
    if (options.queryParameters.isNotEmpty) {
      debugPrint("🔍 Query: ${options.queryParameters}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("✅ [RESPONSE] ${response.statusCode} ${response.realUri}");
    if (kDebugMode) {
      debugPrint("📦 Data: ${response.data}");
    }
    super.onResponse(response, handler);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   debugPrint("❌ [ERROR] ${err.message}");
  //   super.onError(err, handler);
  // }
}
