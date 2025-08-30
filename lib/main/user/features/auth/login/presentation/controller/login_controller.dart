import 'package:auto_find/core/utils/keyboard_utils.dart';
import 'package:auto_find/core/utils/validation_utils.dart';
import 'package:auto_find/main/navigation/presentation/page/navigation_page.dart';
import 'package:auto_find/main/user/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserUseCase _useCase;

  LoginController(this._useCase);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Validate input
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

  /// Login event
  Future<void> onLogin() async {
    KeyboardUtils.hiddenKeyboard();
    if (!_validation()) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final user = await _useCase.login(
        userNameController.text.trim(),
        passwordController.text.trim(),
      );

      // Nếu login thành công, điều hướng sang NavigationPage
      Get.offAllNamed(const NavigationPage().routeName,
          arguments: {"user": user});
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        "Đăng nhập thất bại",
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
