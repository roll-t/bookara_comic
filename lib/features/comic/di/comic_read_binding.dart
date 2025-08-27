import 'package:bookara/features/comic/data_layer/usecase/get_chapter_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/module/detail/controller/comic_read_controller.dart';
import 'package:get/get.dart';

class ComicReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetChapterDetailUsecase());
    Get.lazyPut(
      () => ComicReadController(
        Get.find(),
      ),
    );
  }
}
