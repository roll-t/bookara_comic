import 'package:auto_find/main/navigation/presentation/controller/tab_manage_controller.dart';
import 'package:get/get.dart';

class TabManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabManageController());
  }
}
