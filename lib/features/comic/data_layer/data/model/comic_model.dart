import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_latest_model.dart';

class ComicModel {
  final String id;
  final String name;
  final String slug;
  final List<String> originName;
  final String status;
  final String thumbUrl;
  final bool subDocQuyen;
  final List<CategoryComicModel> category;
  final DateTime? updatedAt;
  final List<ChapterLatestModel> chaptersLatest;

  ComicModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.status,
    required this.thumbUrl,
    required this.subDocQuyen,
    required this.category,
    required this.updatedAt,
    required this.chaptersLatest,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      originName: (json['origin_name'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      status: json['status'] ?? '',
      thumbUrl: json['thumb_url'] ?? '',
      subDocQuyen: json['sub_docquyen'] ?? false,
      category: (json['category'] as List<dynamic>? ?? [])
          .map((e) => CategoryComicModel.fromJson(e))
          .toList(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      chaptersLatest: (json['chaptersLatest'] as List<dynamic>? ?? [])
          .map((e) => ChapterLatestModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'origin_name': originName,
      'status': status,
      'thumb_url': thumbUrl,
      'sub_docquyen': subDocQuyen,
      'category': category.map((e) => e.toJson()).toList(),
      'updatedAt': updatedAt?.toIso8601String(),
      'chaptersLatest': chaptersLatest.map((e) => e.toJson()).toList(),
    };
  }
}
