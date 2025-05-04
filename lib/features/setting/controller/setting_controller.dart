import 'package:bookara/core/storage/app_get_storage.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isDarkMode = false.obs;
  var selectedLanguage = 'English'.obs;
  final themeController = Get.find<ThemeController>();

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    themeController.toggleTheme();
  }

  void setLanguage(String language) {
    AppGetStorage.setLanguage(language);
  }
}
