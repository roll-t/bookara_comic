import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_category_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_home_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_list_type_comic_usecase.dart';
import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:get/get.dart';

class ComicBinding extends Bindings {
  @override
  void dependencies() {
    //REPOSITORY
    Get.lazyPut(() => ComicRepository());

    // USECASE
    Get.lazyPut(() => GetCategoryComicUsecase());
    Get.lazyPut(() => GetListTypeComicUsecase());
    Get.lazyPut(() => GetHomeComicUsecase());

    //CONTROLLER
    Get.put(
      ComicController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
      permanent: true,
    );
  }
}
