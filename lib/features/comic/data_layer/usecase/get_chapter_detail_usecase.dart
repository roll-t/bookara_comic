import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_detail_model.dart';
import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';

class GetChapterDetailUsecase extends UsecaseAbs<ComicRepository> {
  
  ///---> [Get comic category]
  Future<ChapterDetailModel?> call(String urlApi) async {
    AppLogger.i(">>> API DATA LOADED");
    final result = await repository.getChapterDetail(urlApi);
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
