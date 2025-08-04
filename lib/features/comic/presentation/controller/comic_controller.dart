import 'package:bookara/features/comic/data_layer/data/db_controller/db_comic_controller.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_category_comic_usecase.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_list_type_comic_usecase.dart';

class ComicController extends DbComicController {
  ComicController(
    this._categoryComicUsecase,
    this._getListTypeComicUsecase,
  );
  final GetCategoryComicUsecase _categoryComicUsecase;
  final GetListTypeComicUsecase _getListTypeComicUsecase;

  @override
  Future<void> onInit() async {
    super.onInit();
    print(await _categoryComicUsecase());
    print(await _getListTypeComicUsecase("sap-ra-mat"));
  }
}
