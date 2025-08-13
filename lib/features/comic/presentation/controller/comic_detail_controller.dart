import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_comic_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/comic_argument.dart';
import 'package:get/get.dart';

class ComicDetailController extends GetxController
    with ArgumentHandlerMixinController<ComicArgument> {
  //---> [CONSTRUCTOR]
  ComicDetailController(
    this._getComicDetailUsecase,
  );

  ///---> [USECASE]
  final GetComicDetailUsecase _getComicDetailUsecase;

  final Rx<ComicModel?> comicDetail = Rx<ComicModel?>(null);

  @override
  void onReady() {
    initializedData();
  }

  Future<void> initializedData() async {
    handleArgumentFromGet();

    bool hasData = handleArgumentFromGet();
    if (hasData) {
      // Load comic details using the slug from the argument
      comicDetail.value = await _getComicDetailUsecase(argsData!.slug.orEmpty());
    } else {
      print("No valid argument provided for ComicDetailController.");
    }
  }
}
