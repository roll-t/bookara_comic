import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/db_controller/db_comic_controller.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';

class GetListTypeComicUsecase
    extends UsecaseAbs<ComicRepository, DbComicController> {
  ///---> [Get comic category]
  Future<List<ComicModel>?> call(String type, {int page = 1}) async {
    if (dbController.items.isNotEmpty) {
      AppLogger.i(">>> CACHE DATA LOADED");
      return dbController.items;
    }
    AppLogger.i(">>> API DATA LOADED");
    final result = await repository.getListType(type, page: page);
    if (result.isSuccess && result.data != null) {
      dbController.saveItems(result.data!);
      return result.data;
    }
    return null;
  }
}
