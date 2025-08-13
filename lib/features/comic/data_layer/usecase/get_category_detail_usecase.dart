import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';

class GetCategoryDetailUsecase extends UsecaseAbs<ComicRepository> {
  ///---> [Get comic list by category slug]
  Future<List<ComicModel>?> call(String? slug, {int page = 1}) async {
    AppLogger.i(">>> LOAD CATEGORY DETAIL: $slug");
    if (slug == null || slug.isEmpty) {
      AppLogger.e(">>> ERROR: Slug is null or empty");
      return null;
    }
    final result = await repository.getCategoryDetail(slug, page: page);
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
