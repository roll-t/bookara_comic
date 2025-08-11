import 'package:bookara/features/comic/data_layer/data/model/bread_crumb_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/params_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/seo_on_page_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';

class ComicResponse {
  final SeoOnPageModel? seoOnPage;
  final List<BreadCrumbModel>? breadCrumb;
  final String? titlePage;
  final List<ComicModel> items;
  final ParamsModel? params;
  final String? typeList;
  final String? appDomainFrontend;
  final String? appDomainCdnImage;

  ComicResponse({
    this.seoOnPage,
    this.breadCrumb,
    this.titlePage,
    required this.items,
    this.params,
    this.typeList,
    this.appDomainFrontend,
    this.appDomainCdnImage,
  });

  factory ComicResponse.fromJson(Map<String, dynamic> json) {
    return ComicResponse(
      seoOnPage: json['seoOnPage'] != null
          ? SeoOnPageModel.fromJson(json['seoOnPage'])
          : null,
      breadCrumb: json['breadCrumb'] != null
          ? (json['breadCrumb'] as List)
              .map((e) => BreadCrumbModel.fromJson(e))
              .toList()
          : null,
      titlePage: json['titlePage'],
      items: (json['items'] as List? ?? [])
          .map((e) => ComicModel.fromJson(e))
          .toList(),
      params:
          json['params'] != null ? ParamsModel.fromJson(json['params']) : null,
      typeList: json['type_list'],
      appDomainFrontend: json['APP_DOMAIN_FRONTEND'],
      appDomainCdnImage: json['APP_DOMAIN_CDN_IMAGE'],
    );
  }
}
