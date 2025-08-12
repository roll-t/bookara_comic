import 'package:bookara/features/comic/presentation/controller/comic_explore_controller.dart';
import 'package:get/get.dart';

class ComicExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicExploreController());
  }
}
