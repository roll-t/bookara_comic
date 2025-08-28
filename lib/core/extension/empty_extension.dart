import 'package:auto_find/core/config/const/app_icons.dart';
import 'package:flutter/material.dart';

extension NullCheckExtension on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension StringNullExt on String? {
  String orNA() => this ?? "N/A";
}

extension StringEmptyExt on String? {
  String orEmpty() => this ?? "";
}

extension WidgetVisibilityExtension on Widget? {
  Widget visible([bool isVisible = true]) {
    if (this == null || !isVisible) {
      return const SizedBox.shrink();
    }
    return this!;
  }
}

extension SafeIconUrlExtension on String? {
  String orIcNull([String? defaultIcon]) {
    return this ?? (defaultIcon ?? AppIcons.icNotUrl);
  }
}

extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}

