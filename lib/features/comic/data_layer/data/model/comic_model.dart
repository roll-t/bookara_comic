import 'package:bookara/features/comic/data_layer/data/model/chapter_latest_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_server_model.dart';
import 'category_comic_model.dart';

class ComicModel {
  final String? id;
  final String? name;
  final String? slug;
  final List<String>? originName;
  final String? content;
  final String? status;
  final String? thumbUrl;
  final bool? subDocquyen;
  final List<String>? author;
  final List<CategoryComicModel>? category;
  final List<ChapterServerModel>? chapters; // ⬅ sửa kiểu dữ liệu
  final List<ChapterLatestModel>? chaptersLatest;
  final String? updatedAt;

  ComicModel({
    this.id,
    this.name,
    this.slug,
    this.originName,
    this.content,
    this.status,
    this.thumbUrl,
    this.subDocquyen,
    this.author,
    this.category,
    this.chapters,
    this.chaptersLatest,
    this.updatedAt,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      originName: (json['origin_name'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      content: json['content'] ?? '',
      status: json['status'] ?? '',
      thumbUrl: json['thumb_url'] ?? '',
      subDocquyen: json['sub_docquyen'] ?? false,
      author: (json['author'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      category: (json['category'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => CategoryComicModel.fromJson(e))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => ChapterServerModel.fromJson(e))
          .toList(),
      chaptersLatest: (json['chaptersLatest'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => ChapterLatestModel.fromJson(e))
          .toList(),
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'origin_name': originName,
      'content': content,
      'status': status,
      'thumb_url': thumbUrl,
      'sub_docquyen': subDocquyen,
      'author': author,
      'category': category?.map((e) => e.toJson()).toList() ?? [],
      'chapters': chapters?.map((e) => e.toJson()).toList() ?? [],
      'chaptersLatest': chaptersLatest?.map((e) => e.toJson()).toList() ?? [],
      'updatedAt': updatedAt,
    };
  }
}
