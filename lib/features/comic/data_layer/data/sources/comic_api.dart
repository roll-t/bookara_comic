// import 'package:bookara/core/config/result.dart';
// import 'package:bookara/core/services/network/api_client.dart';
// import 'package:bookara/core/services/network/api_enpoint.dart';
// import 'package:get/get.dart';

// class ComicApi {
//   final ApiClient _api = Get.find<ApiClient>();

//   Future<Result> getHome() => _api.get(
//         ApiEndpoint.home,
//       );

//   Future<Result> getList(String type, {int page = 1}) => _api.get(
//         ApiEndpoint.list(type),
//         query: {'page': page},
//       );

//   Future<Result> getCategories() {
//     return _api.get(
//       ApiEndpoint.categories,
//     );
//   }

//   Future<Result> getCategoryDetail(String slug, {int page = 1}) => _api.get(
//         ApiEndpoint.categoryDetail(slug),
//         query: {'page': page},
//       );

//   Future<Result> getComicDetail(String slug) => _api.get(
//         ApiEndpoint.comicDetail(slug),
//       );

//   Future<Result> search(String keyword) => _api.get(
//         ApiEndpoint.search,
//         query: {'keyword': keyword},
//       );
// }
