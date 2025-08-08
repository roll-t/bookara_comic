import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';

class GetComicDetailUsecase extends UsecaseAbs<ComicRepository> {
  ///---> [Get comic detail by slug]
  Future<ComicModel?> call(String slug) async {
    AppLogger.i(">>> LOAD COMIC DETAIL: $slug");
    final result = await repository.getComicDetail(slug);
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
