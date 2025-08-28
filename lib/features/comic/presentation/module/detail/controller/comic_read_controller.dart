import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_detail_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_chapter_detail_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/chapter_detail_argument.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ComicReadController extends GetxController
    with ArgumentHandlerMixinController<ChapterDetailArgument> {
  ComicReadController(this._chapterDetailUsecase);
  final GetChapterDetailUsecase _chapterDetailUsecase;

  Rx<ChapterDetailModel> chapterDetailModel = ChapterDetailModel().obs;

  /// --- thêm mới ---s
  final ScrollController scrollController = ScrollController();
  final RxInt visibleCount = 5.obs;
  List<String> chapterImageList = [];

  var showControls = false.obs;

  @override
  void onReady() {
    super.onReady();
    initializedData();
    scrollController.addListener(_onScroll);
  }

  void toggleControls() {
    showControls.value = !showControls.value;
  }

  Future<void> initializedData() async {
    bool hasData = handleArgumentFromGet();
    if (hasData) {
      chapterDetailModel.value =
          await _chapterDetailUsecase((argsData?.chapterApiData).orEmpty()) ??
              ChapterDetailModel();

      /// khi có data thì lưu danh sách ảnh
      final chapter = chapterDetailModel.value;
      final images = chapter.item?.chapterImages ?? [];
      chapterImageList = images
          .map((e) =>
              "${chapter.domainCdn}/${chapter.item?.chapterPath}/${e.imageFile}")
          .toList();
    }
  }

  /// --- thêm mới ---
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadMore();
    }
  }

  void loadMore() {
    if (visibleCount.value < chapterImageList.length) {
      visibleCount.value += 5; // mỗi lần load thêm 5 ảnh
    }
  }

  /// --- thêm mới: scroll bằng tap ---
  void scrollUp() {
    if (showControls.value) {
      toggleControls();
    }
    final current = scrollController.position.pixels;
    final target = (current - 300)
        .clamp(0, scrollController.position.maxScrollExtent)
        .toDouble();
    scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollDown() {
    if (showControls.value) {
      toggleControls();
    }
    final current = scrollController.position.pixels;
    final target = (current + 300)
        .clamp(0, scrollController.position.maxScrollExtent)
        .toDouble();
    scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// Đổi chapter theo index
  Future<void> changeChapter(int index) async {
    final list = argsData?.listChapter;
    if (list == null || index < 0 || index >= list.length) return;

    // reset trước khi load
    visibleCount.value = 5;
    chapterImageList.clear();
    chapterDetailModel.value = ChapterDetailModel();
    scrollController.jumpTo(0);

    final chapterApiData = list[index].chapterApiData.orEmpty();
    chapterDetailModel.value =
        await _chapterDetailUsecase(chapterApiData) ?? ChapterDetailModel();

    // gán lại danh sách ảnh
    final chapter = chapterDetailModel.value;
    final images = chapter.item?.chapterImages ?? [];
    chapterImageList = images
        .map((e) =>
            "${chapter.domainCdn}/${chapter.item?.chapterPath}/${e.imageFile}")
        .toList();

    update(["CHAPTER_SELECTED"]);
  }

  /// Chuyển sang chapter trước
  Future<void> prevChapter() async {
    final list = argsData?.listChapter;
    if (list == null) return;

    final currentIndex = list.indexWhere((c) =>
        c.chapterName == chapterDetailModel.value.item?.chapterName &&
        c.chapterTitle == chapterDetailModel.value.item?.chapterTitle);

    if (currentIndex > 0) {
      await changeChapter(currentIndex - 1);
    }
  }

  /// Chuyển sang chapter sau
  Future<void> nextChapter() async {
    final list = argsData?.listChapter;
    if (list == null) return;

    final currentIndex = list.indexWhere((c) =>
        c.chapterName == chapterDetailModel.value.item?.chapterName &&
        c.chapterTitle == chapterDetailModel.value.item?.chapterTitle);

    if (currentIndex >= 0 && currentIndex < list.length - 1) {
      await changeChapter(currentIndex + 1);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
