import 'package:auto_find/core/config/const/app_enum.dart';

class Result<T> {
  final Results status;
  String? message;
  T? data;

  Result({
    required this.status,
    this.message,
    this.data,
  });

  bool get isSuccess => status == Results.success;
}
