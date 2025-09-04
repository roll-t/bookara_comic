import 'package:auto_find/main/showroom/features/car_manage/presentation/controller/car_in_auto_controller.dart';
import 'package:get/get.dart';

class CarInAutoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CarInAutoController());
  }
}
