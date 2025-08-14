import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_detail_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_chapter_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/chapter_detail_argument.dart';
import 'package:get/get.dart';

class ComicReadController extends GetxController
    with ArgumentHandlerMixinController<ChapterDetailArgument> {
  ComicReadController(this._chapterDetailUsecase);
  final GetChapterDetailUsecase _chapterDetailUsecase;
  Rx<ChapterDetailModel> chapterDetailModel = ChapterDetailModel().obs;
  @override
  void onReady() {
    super.onReady();
    initializedData();
  }

  Future<void> initializedData() async {
    bool hasData = handleArgumentFromGet();
    if (hasData) {
      chapterDetailModel.value =
          await _chapterDetailUsecase((argsData?.chapterApiData).orEmpty()) ??
              ChapterDetailModel();
    }
  }
}
