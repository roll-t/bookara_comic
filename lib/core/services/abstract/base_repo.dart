import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/config/result.dart';

abstract class BaseRepository {
  Future<Result<T>> handleRequest<T>({
    required Future<Result<dynamic>> Function() request,
    required T Function(dynamic data) parse,
    String? defaultErrorMessage,
  }) async {
    try {
      final res = await request();
      if (res.isSuccess && res.data != null) {
        final parsedData = parse(res.data);
        return Result(
          status: Results.success,
          data: parsedData,
        );
      } else {
        return Result(
          status: Results.error,
          message: res.message ?? defaultErrorMessage ?? 'Đã có lỗi xảy ra',
        );
      }
    } catch (e) {
      print(">>> error: $e");
      return Result(
        status: Results.error,
        message: defaultErrorMessage ?? 'Lỗi hệ thống: ${e.toString()}',
      );
    }
  }
}
