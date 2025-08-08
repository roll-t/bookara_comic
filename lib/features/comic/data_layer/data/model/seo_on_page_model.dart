class SeoOnPageModel {
  final String? ogType;
  final String? titleHead;
  final String? descriptionHead;
  final List<String> ogImage;
  final String? ogUrl;

  SeoOnPageModel({
    this.ogType,
    this.titleHead,
    this.descriptionHead,
    required this.ogImage,
    this.ogUrl,
  });

  factory SeoOnPageModel.fromJson(Map<String, dynamic> json) {
    return SeoOnPageModel(
      ogType: json['og_type'],
      titleHead: json['titleHead'],
      descriptionHead: json['descriptionHead'],
      ogImage: List<String>.from(json['og_image'] ?? []),
      ogUrl: json['og_url'],
    );
  }
}
