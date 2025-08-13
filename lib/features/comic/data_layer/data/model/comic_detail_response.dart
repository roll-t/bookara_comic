import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';

class ComicDetailResponse {
  // final SeoOnPageModel? seoOnPage;
  // final List<BreadCrumbModel>? breadCrumb;
  // final ParamsModel? params;
  final ComicModel? item;
  final String? appDomainCdnImage;

  ComicDetailResponse({
    // this.seoOnPage,
    // this.breadCrumb,
    // this.params,
    this.item,
    this.appDomainCdnImage,
  });

  factory ComicDetailResponse.fromJson(Map<String, dynamic> json) {
    return ComicDetailResponse(
      // seoOnPage: json['seoOnPage'] != null
      //     ? SeoOnPageModel.fromJson(json['seoOnPage'])
      //     : null,
      // breadCrumb: json['breadCrumb'] != null
      //     ? (json['breadCrumb'] as List)
      //         .map((e) => BreadCrumbModel.fromJson(e))
      //         .toList()
      //     : null,
      // params:
      //     json['params'] != null ? ParamsModel.fromJson(json['params']) : null,
      item: json['item'] != null ? ComicModel.fromJson(json['item']) : null,
      appDomainCdnImage: json['APP_DOMAIN_CDN_IMAGE'],
    );
  }
}
