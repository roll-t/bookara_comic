import 'package:auto_find/core/utils/keyboard_utils.dart';
import 'package:auto_find/core/utils/validation_utils.dart';
import 'package:auto_find/features/navigation/presentation/page/navigation_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///---> [Business Logic]
  bool _validation() {
    final fields = [
      {"value": userNameController.text, "label": "Tên đăng nhập"},
      {"value": passwordController.text, "label": "Mật khẩu"},
    ];

    for (final field in fields) {
      final isValid = ValidationUtils.validateRequiredField(
        field["value"]!,
        field["label"]!,
      );
      if (!isValid) return false;
    }
    return true;
  }

  ///---> [Events]
  void onLogin() {
    KeyboardUtils.hiddenKeyboard();
    if (!_validation()) return;
    Get.offAllNamed(const NavigationPage().routeName);
  }
}
