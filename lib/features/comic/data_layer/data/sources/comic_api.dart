import 'package:bookara/core/config/result.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/core/services/network/api_client.dart';
import 'package:bookara/core/services/network/api_enpoint.dart';
import 'package:get/get.dart';

class ComicApi {
  final ApiClient _api = Get.find<ApiClient>();

  // Future<Result<dynamic>> getHome() => _api.get<dynamic>(
  //       ApiEndpoint.home,
  //       parseData: (json) => HomeModel.fromJson(json),
  //     );

  // Future<Result<ComicListModel>> getList(String type, {int page = 1}) =>
  //     _api.get<ComicListModel>(
  //       ApiEndpoint.list(type),
  //       query: {'page': page},
  //       parseData: (json) => ComicListModel.fromJson(json),
  //     );

  Future<Result> getCategories() {
    return _api.get(
      ApiEndpoint.categories,
    );
  }

  // Future<Result<ComicListModel>> getCategoryDetail(String slug, {int page = 1}) =>
  //     _api.get<ComicListModel>(
  //       ApiEndpoint.categoryDetail(slug),
  //       query: {'page': page},
  //       parseData: (json) => ComicListModel.fromJson(json),
  //     );

  // Future<Result<ComicDetailModel>> getComicDetail(String slug) => _api.get<ComicDetailModel>(
  //       ApiEndpoint.comicDetail(slug),
  //       parseData: (json) => ComicDetailModel.fromJson(json),
  //     );

  // Future<Result<SearchResultModel>> search(String keyword) => _api.get<SearchResultModel>(
  //       ApiEndpoint.search,
  //       query: {'keyword': keyword},
  //       parseData: (json) => SearchResultModel.fromJson(json),
  //     );
}
