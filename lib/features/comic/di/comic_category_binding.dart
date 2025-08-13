import 'package:bookara/features/comic/data_layer/usecase/get_category_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/controller/comic_category_controller.dart';
import 'package:get/get.dart';

class ComicCategoryBinding extends Bindings {
  @override
  void dependencies() {
    ///---> [USECASE]
    Get.lazyPut(() => GetCategoryDetailUsecase());

    ///---> [CONTROLLER]
    Get.lazyPut(
      () => ComicCategoryController(
        Get.find<GetCategoryDetailUsecase>(),
      ),
    );
  }
}
