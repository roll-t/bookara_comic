import 'package:bookara/core/config/result.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';

abstract class ComicRepository {
  Future<Result<List<CategoryComicModel>>> getCategoryComic();
}
