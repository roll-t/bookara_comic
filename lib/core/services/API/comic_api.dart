import 'package:bookara/core/services/network/api_client.dart';
import 'package:bookara/core/services/network/api_enpoint.dart';
import 'package:get/get.dart';

class ComicApi {

  final ApiClient _api = Get.find<ApiClient>();

  Future<dynamic> getHome() => _api.get(ApiEndpoint.home);

  Future<dynamic> getList(String type, {int page = 1}) =>
      _api.get(ApiEndpoint.list(type), query: {'page': page});

  Future<dynamic> getCategories() => _api.get(ApiEndpoint.categories);

  Future<dynamic> getCategoryDetail(String slug, {int page = 1}) =>
      _api.get(ApiEndpoint.categoryDetail(slug), query: {'page': page});

  Future<dynamic> getComicDetail(String slug) =>
      _api.get(ApiEndpoint.comicDetail(slug));

  Future<dynamic> search(String keyword) =>
      _api.get(ApiEndpoint.search, query: {'keyword': keyword});
}
