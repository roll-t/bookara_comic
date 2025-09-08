import 'package:auto_find/main/showroom/domain/repositories/brand_car_repository.dart';
import 'package:auto_find/main/showroom/domain/repositories/color_repository.dart';
import 'package:auto_find/main/showroom/domain/repositories/type_car_repository.dart';
import 'package:auto_find/main/showroom/domain/usecase/brand_product_usecase.dart';
import 'package:auto_find/main/showroom/domain/usecase/color_uscase.dart';
import 'package:auto_find/main/showroom/domain/usecase/type_car_usecase.dart';
import 'package:auto_find/main/showroom/features/car_manage/presentation/controller/car_detail_controller.dart';
import 'package:get/get.dart';

class CarDetailBinding extends Bindings {
  @override
  void dependencies() {
    ///[REPOSITORY]
    Get.lazyPut(() => BrandCarRepository());
    Get.lazyPut(() => TypeCarRepository());
    Get.lazyPut(() => ColorRepository());

    ///[USECASE]
    Get.lazyPut(
      () => BrandProductUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut(
      () => TypeCarUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut(
      () => ColorUsecase(
        Get.find(),
      ),
    );

    ///[CONTROLLER]
    Get.lazyPut(
      () => CarDetailController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
