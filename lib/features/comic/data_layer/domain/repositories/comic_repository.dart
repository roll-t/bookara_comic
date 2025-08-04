import 'package:bookara/core/config/result.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';

abstract class ComicRepository {
  Future<Result<List<CategoryComicModel>>> getCategoryComic();
  Future<Result<List<ComicModel>>> getListType(String type, {int page=1});
}
