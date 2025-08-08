class BreadCrumbModel {
  final String? name;
  final String? slug;
  final bool? isCurrent;
  final int? position;

  BreadCrumbModel({
    this.name,
    this.slug,
    this.isCurrent,
    this.position,
  });

  factory BreadCrumbModel.fromJson(Map<String, dynamic> json) {
    return BreadCrumbModel(
      name: json['name'],
      slug: json['slug'],
      isCurrent: json['isCurrent'],
      position: json['position'],
    );
  }
}
