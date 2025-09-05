import 'package:auto_find/main/showroom/domain/repositories/car_repository.dart';
import 'package:auto_find/main/showroom/domain/usecase/car_usecase.dart';
import 'package:auto_find/main/showroom/features/car_manage/presentation/controller/all_car_controller.dart';
import 'package:get/get.dart';

class AllCarBinding extends Bindings {
  @override
  void dependencies() {
    ///---> [Repositories]
    Get.lazyPut(() => CarRepository());

    ///---> [Usecase]
    Get.lazyPut(
      () => CarUsecase(
        Get.find(),
      ),
    );

    ///---> [Controller]
    Get.lazyPut(
      () => AllCarController(
        Get.find(),
      ),
    );
  }
}
