import 'package:auto_find/features/navigation/presentation/controller/tabs/profile_controller.dart';
import 'package:auto_find/features/setting/presentation/controller/setting_controller.dart';
import 'package:get/get.dart';

class TabProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingController());
  }
}
