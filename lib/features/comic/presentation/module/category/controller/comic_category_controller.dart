import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_category_detail_usecase.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_list_type_comic_usecase.dart';
import 'package:bookara/features/comic/presentation/argument/category_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicCategoryController extends GetxController
    with ArgumentHandlerMixinController<CategoryArgument> {
  ComicCategoryController(
    this._getCategoryDetailUsecase,
    this._getListTypeComicUsecase,
  );

  ///---> [ARGUMENT]
  final List<String> listType = [
    "truyen-moi",
    "sap-ra-mat",
    "dang-phat-hanh",
    "hoan-thanh",
  ];
  final GetCategoryDetailUsecase _getCategoryDetailUsecase;
  final GetListTypeComicUsecase _getListTypeComicUsecase;

  final RxList<ComicModel> listComicByCategory = <ComicModel>[].obs;
  final RxString titlePage = ''.obs;

  int _currentPage = 1;
  bool _isLastPage = false;
  final RxBool isLoadingMore = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore.value &&
          !_isLastPage) {
        loadMore();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initializedData();
  }

  Future<void> _initializedData() async {
    bool hasData = handleArgumentFromGet();
    if (hasData) {
      titlePage.value = (argsData?.name).orNA();
      _currentPage = 1;
      _isLastPage = false;
      await _fetchPage(_currentPage, clearBeforeFetch: true);
    }
  }

  Future<void> _fetchPage(int page, {bool clearBeforeFetch = false}) async {
    await fetchAndSetList<ComicModel>(
      fetchData: () {
        if (!listType.contains(argsData?.slug)) {
          return _getCategoryDetailUsecase.call(
            argsData?.slug ?? "",
            page: page,
          );
        } else {
          return _getListTypeComicUsecase.call(
            argsData?.slug ?? "",
            page: page,
          );
        }
      },
      isLoading: isLoadingMore,
      targetList: listComicByCategory,
      clearBeforeFetch: clearBeforeFetch,
    ).then((_) {
      if (page == _currentPage && (listComicByCategory.length < page * 20)) {
        _isLastPage = true;
      }
    });
  }

  Future<void> loadMore() async {
    if (isLoadingMore.value || _isLastPage) return;
    _currentPage++;
    await _fetchPage(_currentPage);
  }

  Future<void> fetchAndSetList<T>({
    required RxBool isLoading,
    required RxList<T> targetList,
    required Future<List<T>?> Function() fetchData,
    String? updateId,
    bool clearBeforeFetch = true,
  }) async {
    try {
      isLoading.value = true;
      if (updateId != null) update([updateId]);

      final data = await fetchData();
      if (data != null) {
        if (clearBeforeFetch) targetList.clear();
        targetList.addAll(data);
        if (data.isEmpty) _isLastPage = true;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      if (updateId != null) update([updateId]);
    }
  }
}
