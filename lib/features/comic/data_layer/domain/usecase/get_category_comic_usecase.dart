import 'package:bookara/core/config/result.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';

class GetCategoryComicUsecase extends UsecaseAbs<ComicRepository> {

  Future<List<CategoryComicModel>?> call() async {
    final Result<List<CategoryComicModel>> result =
        await repository.getCategoryComic();
    if (result.isSuccess) {
      return result.data;
    }
    return null;
  }
  
}
