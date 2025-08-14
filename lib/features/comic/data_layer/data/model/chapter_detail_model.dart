class ChapterDetailModel {
  String? domainCdn;
  ChapterItem? item;

  ChapterDetailModel({
    this.domainCdn,
    this.item,
  });

  factory ChapterDetailModel.fromJson(Map<String, dynamic> json) {
    return ChapterDetailModel(
      domainCdn: json['domain_cdn'] ?? '',
      item: ChapterItem.fromJson(json['item'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'domain_cdn': domainCdn,
      'item': item!.toJson(),
    };
  }
}

class ChapterItem {
  final String id;
  final String comicName;
  final String chapterName;
  final String chapterTitle;
  final String chapterPath;
  final List<ChapterImage> chapterImages;

  ChapterItem({
    required this.id,
    required this.comicName,
    required this.chapterName,
    required this.chapterTitle,
    required this.chapterPath,
    required this.chapterImages,
  });

  factory ChapterItem.fromJson(Map<String, dynamic> json) {
    return ChapterItem(
      id: json['_id'] ?? '',
      comicName: json['comic_name'] ?? '',
      chapterName: json['chapter_name'] ?? '',
      chapterTitle: json['chapter_title'] ?? '',
      chapterPath: json['chapter_path'] ?? '',
      chapterImages: (json['chapter_image'] as List? ?? [])
          .map((e) => ChapterImage.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'comic_name': comicName,
      'chapter_name': chapterName,
      'chapter_title': chapterTitle,
      'chapter_path': chapterPath,
      'chapter_image': chapterImages.map((e) => e.toJson()).toList(),
    };
  }
}

class ChapterImage {
  final int imagePage;
  final String imageFile;

  ChapterImage({
    required this.imagePage,
    required this.imageFile,
  });

  factory ChapterImage.fromJson(Map<String, dynamic> json) {
    return ChapterImage(
      imagePage: json['image_page'] ?? 0,
      imageFile: json['image_file'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_page': imagePage,
      'image_file': imageFile,
    };
  }
}
