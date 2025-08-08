import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';

class SearchComicUsecase extends UsecaseAbs<ComicRepository> {
  ///---> [Search comic by keyword]
  Future<List<ComicModel>?> call(String keyword) async {
    AppLogger.i(">>> SEARCH COMIC: $keyword");
    final result = await repository.search(keyword);
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
