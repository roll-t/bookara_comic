import 'package:bookara/features/management/management_controller.dart';
import 'package:get/get.dart';

class ManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagementController());
  }
}
