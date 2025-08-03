class CategoryComicModel {
  final String id;
  final String slug;
  final String name;

  CategoryComicModel({
    required this.id,
    required this.slug,
    required this.name,
  });

  factory CategoryComicModel.fromJson(Map<String, dynamic> json) {
    return CategoryComicModel(
      id: json['_id'] ?? '',
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'slug': slug,
      'name': name,
    };
  }
}
