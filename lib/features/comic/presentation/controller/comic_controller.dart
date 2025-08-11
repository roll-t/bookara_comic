import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_category_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_home_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/usecase/get_list_type_comic_usecase.dart';
import 'package:get/get.dart';

class ComicController extends GetxController {
  ///---> [CONSTRUCTOR]

  ComicController(
    this._categoryComicUsecase,
    this._getListTypeComicUsecase,
    this._getHomeComicUsecase,
  );

  ///---> [USECASE]
  final GetCategoryComicUsecase _categoryComicUsecase;
  final GetListTypeComicUsecase _getListTypeComicUsecase;
  final GetHomeComicUsecase _getHomeComicUsecase;

  ///---> [VARIABLE]
  RxList<ComicModel> listHomeComic = <ComicModel>[].obs; //home
  RxList<ComicModel> listNewRelease = <ComicModel>[].obs; // truyen-moi
  RxList<ComicModel> listComingSoon = <ComicModel>[].obs; // sap-ra-mat
  RxList<ComicModel> listOngoing = <ComicModel>[].obs; // dang-phat-hanh
  RxList<ComicModel> listCompleted = <ComicModel>[].obs; // hoan-thanh

  ///---> [LOADING]
  RxBool isLoadingCarousel = false.obs;
  RxBool isLoadingListComic = false.obs;

  ///---> [INIT]
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initializeData();
  }

  ///---> [DATA INITIALIZED]
  Future<void> initializeData() async {
    ///---> [Home-data using in carousel]
    await fetchAndSetList<ComicModel>(
      isLoading: isLoadingCarousel,
      targetList: listHomeComic,
      fetchData: _getHomeComicUsecase.call,
      updateId: "CAROUSEL_ID",
    );
    await fetchAndSetList<ComicModel>(
      isLoading: isLoadingListComic,
      targetList: listNewRelease,
      fetchData: () => _getListTypeComicUsecase("truyen-moi", page: 1),
    );
    await fetchAndSetList<ComicModel>(
      isLoading: isLoadingListComic,
      targetList: listComingSoon,
      fetchData: () => _getListTypeComicUsecase("sap-ra-mat", page: 1),
    );
    await fetchAndSetList<ComicModel>(
      isLoading: isLoadingListComic,
      targetList: listCompleted,
      fetchData: () => _getListTypeComicUsecase("hoan-thanh", page: 1),
    );
    await fetchAndSetList<ComicModel>(
      isLoading: isLoadingListComic,
      targetList: listOngoing,
      fetchData: () => _getListTypeComicUsecase("dang-phat-hanh", page: 1),
    );
  }

  ///---> [UTILS]
  Future<void> fetchAndSetList<T>({
    required RxBool isLoading,
    required RxList<T> targetList,
    required Future<List<T>?> Function() fetchData,
    String? updateId,
    bool clearBeforeFetch = true,
  }) async {
    try {
      isLoading.value = true;
      if (updateId != null) {
        update([updateId]);
      }
      final data = await fetchData();
      if (data != null) {
        if (clearBeforeFetch) targetList.clear();
        targetList.addAll(data);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      if (updateId != null) {
        update([updateId]);
      }
    }
  }
}
