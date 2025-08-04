import 'package:bookara/core/config/const/app_enum.dart';
import 'package:bookara/core/config/result.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/sources/comic_api.dart';
import 'package:bookara/features/comic/data_layer/domain/repositories/comic_repository.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicApi _apiService = ComicApi();

  @override
  Future<Result<List<CategoryComicModel>>> getCategoryComic() async {
    final res = await _apiService.getCategories();

    if (res.isSuccess && res.data != null && res.data['items'] is List) {
      final items = (res.data['items'] as List)
          .map((e) => CategoryComicModel.fromJson(e))
          .toList();

      return Result(
        status: Results.success,
        data: items,
      );
    } else {
      return Result(
        status: Results.error,
        message: res.message ?? 'Không thể tải danh sách thể loại',
      );
    }
  }

  @override
  Future<Result<List<ComicModel>>> getListType(String type,
      {int page = 1}) async {


    final res = await _apiService.getList(type, page: page);

    if (res.isSuccess && res.data != null && res.data['items'] is List) {
      final items = (res.data['items'] as List)
          .map((e) => ComicModel.fromJson(e))
          .toList();

      return Result(
        status: Results.success,
        data: items,
      );
    } else {
      return Result(
        status: Results.error,
        message: res.message ?? 'Không thể tải danh sách thể loại',
      );
    }
  }
}
