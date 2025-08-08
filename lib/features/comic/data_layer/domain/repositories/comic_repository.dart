import 'package:bookara/core/config/result.dart';
import 'package:bookara/core/services/abstract/base_repo.dart';
import 'package:bookara/core/services/network/api_client.dart';
import 'package:bookara/core/services/network/api_enpoint.dart';
import 'package:bookara/features/comic/data_layer/domain/dto/category_response_model.dart';
import 'package:bookara/features/comic/data_layer/domain/dto/comic_response_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:get/get.dart';

class ComicRepository extends BaseRepository {
  final ApiClient _api = Get.find<ApiClient>();

  /* GET LIST [CATEGORY] COMIC */
  Future<Result<List<CategoryComicModel>>> getCategoryComic() {
    return handleRequest<List<CategoryComicModel>>(
      request: () => _api.get(ApiEndpoint.categories),
      parse: (data) => CategoryResponseModel.fromJson(data).items,
      defaultErrorMessage: 'Không thể tải danh sách thể loại',
    );
  }

  /* GET LIST [TYPE COMIC] */
  Future<Result<List<ComicModel>>> getListType(String type, {int page = 1}) {
    return handleRequest<List<ComicModel>>(
      request: () => _api.get(ApiEndpoint.list(type), query: {'page': page}),
      parse: (data) => ComicResponseModel.fromJson(data).items,
      defaultErrorMessage: 'Không thể tải danh sách truyện',
    );
  }

  /* GET [CATEGORY DETAIL] COMIC */
  Future<Result<List<ComicModel>>> getCategoryDetail(String slug,
      {int page = 1}) {
    return handleRequest<List<ComicModel>>(
      request: () => _api.get(ApiEndpoint.categoryDetail(slug), query: {'page': page}),
      parse: (data) =>ComicResponseModel.fromJson(data).items,
      defaultErrorMessage: 'Không thể tải chi tiết thể loại',
    );
  }

  /* GET [COMIC DETAIL] */
  Future<Result<ComicModel>> getComicDetail(String slug) {
    return handleRequest<ComicModel>(
      request: () => _api.get(ApiEndpoint.comicDetail(slug)),
      parse: (data) => ComicModel.fromJson(data),
      defaultErrorMessage: 'Không thể tải chi tiết truyện',
    );
  }

  /* GET LIST [SEARCH RESULT] COMIC */
  Future<Result<List<ComicModel>>> search(String keyword) {
    return handleRequest<List<ComicModel>>(
      request: () => _api.get(ApiEndpoint.search, query: {'keyword': keyword}),
      parse: (data) => ComicResponseModel.fromJson(data).items,
      defaultErrorMessage: 'Không thể tìm kiếm truyện',
    );
  }

  /* GET LIST [HOME RECOMMENDATION] COMIC */
  Future<Result<List<ComicModel>>> getHome() {
    return handleRequest<List<ComicModel>>(
      request: () => _api.get(ApiEndpoint.home),
      parse: (data) => ComicResponseModel.fromJson(data).items,
      defaultErrorMessage: 'Không thể tải trang chủ',
    );
  }
}
