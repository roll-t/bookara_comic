import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';

class GetListTypeComicUsecase extends UsecaseAbs<ComicRepository> {
  ///---> [Get comic category]
  Future<List<ComicModel>?> call(String type, {int page = 1}) async {
    AppLogger.i(">>> API DATA LOADED");
    final result = await repository.getListType(type, page: page);
    if (result.isSuccess && result.data != null) {
      return result.data;
    }else{
      AppLogger.e("NULL DATA LIST TYPE COMIC");
    }
    return null;
  }
}
