import 'package:bookara/features/comic/presentation/controller/comic_category_controller.dart';
import 'package:get/get.dart';

class ComicCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicCategoryController());
  }
}
