import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_comic_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/comic_argument.dart';
import 'package:get/get.dart';

class ComicDetailController extends GetxController
    with ArgumentHandlerMixinController<ComicArgument> {
  ComicDetailController(this._getComicDetailUsecase);

  final GetComicDetailUsecase _getComicDetailUsecase;
  ComicModel? comicDetail;

  final RxBool isCollapsed = false.obs;
  final RxList<ChapterModel> chapters = <ChapterModel>[].obs;
  final RxList<ChapterModel> filteredChapters = <ChapterModel>[].obs;

  @override
  void onReady() {
    initializedData();
  }

  Future<void> initializedData() async {
    if (handleArgumentFromGet()) {
      comicDetail = await _getComicDetailUsecase(argsData!.slug.orEmpty());
      _initChapterList();
    } else {
      print("No valid argument provided for ComicDetailController.");
    }
    update(['COMIC_DETAIL_ID']);
  }

  /// Lấy danh sách chapter ban đầu
  void _initChapterList() {
    final listChapter = (comicDetail?.chapters?.isNotEmpty ?? false)
        ? comicDetail!.chapters!.first.serverData ?? []
        : <ChapterModel>[];
    filteredChapters.assignAll(listChapter);
    chapters.assignAll(listChapter);
  }

  /// Hàm tìm kiếm local theo số chương
  void searchChapter(String query) {
    if (comicDetail?.chapters?.isEmpty ?? true) return;

    final listChapter = comicDetail!.chapters!.first.serverData ?? [];

    if (query.isEmpty) {
      filteredChapters.assignAll(listChapter);
    } else {
      filteredChapters.assignAll(
        listChapter.where((chapter) {
          final chapterName = chapter.chapterName.orEmpty();
          return chapterName.contains(query);
        }).toList(),
      );
    }
  }
}
