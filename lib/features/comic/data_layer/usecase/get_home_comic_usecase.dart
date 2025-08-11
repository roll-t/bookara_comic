import 'package:bookara/core/config/const/app_logger.dart';
import 'package:bookara/core/services/abstract/usecase_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/repositories/comic_repository.dart';

class GetHomeComicUsecase extends UsecaseAbs<ComicRepository> {
  ///---> [Get homepage recommended comics]
  Future<List<ComicModel>?> call() async {
    AppLogger.i(">>> LOAD HOME COMICS");

    

    final result = await repository.getHome();
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }
}
