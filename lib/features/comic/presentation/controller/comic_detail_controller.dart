import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_comic_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/comic_argument.dart';
import 'package:get/get.dart';

class ComicDetailController extends GetxController
    with ArgumentHandlerMixinController<ComicArgument> {
  ComicDetailController(this._getComicDetailUsecase);

  final GetComicDetailUsecase _getComicDetailUsecase;
  final Rx<ComicModel?> comicDetail = Rx<ComicModel?>(null);
  final RxBool isCollapsed = false.obs;

  @override
  void onReady() {
    initializedData();
  }

  Future<void> initializedData() async {
    if (handleArgumentFromGet()) {
      comicDetail.value =
          await _getComicDetailUsecase(argsData!.slug.orEmpty());
    } else {
      print("No valid argument provided for ComicDetailController.");
    }
    update(['COMIC_DETAIL_ID']);
  }
}
