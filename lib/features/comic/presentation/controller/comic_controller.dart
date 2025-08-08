import 'package:bookara/features/comic/data_layer/domain/usecase/get_category_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_home_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_list_type_comic_usecase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ComicController extends GetxController {
  ComicController(
    this._categoryComicUsecase,
    this._getListTypeComicUsecase,
    this._getHomeComicUsecase,
  );
  final GetCategoryComicUsecase _categoryComicUsecase;
  final GetListTypeComicUsecase _getListTypeComicUsecase;
  final GetHomeComicUsecase _getHomeComicUsecase;

  @override
  Future<void> onInit() async {
    super.onInit();
    print(await _categoryComicUsecase());
    print(await _getListTypeComicUsecase("sap-ra-mat"));
    final list = await _getHomeComicUsecase();
    print(">>> $list");
  }
}
