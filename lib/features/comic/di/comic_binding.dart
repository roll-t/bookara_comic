import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository_impl.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_category_comic_usecase.dart';
import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:get/get.dart';

class ComicBinding extends Bindings {
  @override
  void dependencies() {
    
    //REPOSITORY
    Get.lazyPut<ComicRepository>(() => ComicRepositoryImpl());
    // USECASE
    Get.lazyPut(() => GetCategoryComicUsecase());

    //CONTROLLER
    Get.put(
      ComicController(
        Get.find(),
      ),
    );
  }
}
