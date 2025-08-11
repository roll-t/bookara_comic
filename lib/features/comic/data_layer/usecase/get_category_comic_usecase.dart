import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';

class GetCategoryComicUsecase extends UsecaseAbs<ComicRepository> {
  
  ///---> [Get comic category]
  Future<List<CategoryComicModel>?> call() async {
    AppLogger.i(">>> API DATA LOADED");
    final result = await repository.getCategoryComic();
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
