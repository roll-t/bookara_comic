import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/domain/usecase/get_category_comic_usecase.dart';
import 'package:get/get.dart';

class ComicController extends GetxController {
  ComicController(this._getCategoryComicUsecase);
  final GetCategoryComicUsecase _getCategoryComicUsecase;
  @override
  onInit() async {
    super.onInit();
    final List<CategoryComicModel>? data = await _getCategoryComicUsecase();
    print(data);
  }
}
