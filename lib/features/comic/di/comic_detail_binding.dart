import 'package:bookara/features/comic/data_layer/usecase/get_comic_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/controller/comic_detail_controller.dart';
import 'package:get/get.dart';

class ComicDetailBinding extends Bindings {
  @override
  void dependencies() {
    /// USECASE
    Get.lazyPut(() => GetComicDetailUsecase());

    /// CONTROLLER
    Get.lazyPut(
      () => ComicDetailController(
        Get.find<GetComicDetailUsecase>(),
      ),
    );
  }
}
