import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
