import 'package:bookara/features/navigation/presentation/controller/tabs/profile_controller.dart';
import 'package:bookara/features/setting/presentation/controller/setting_controller.dart';
import 'package:get/get.dart';

class TabProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingController());
  }
}
