class ChapterLatestModel {
  final String filename;
  final String chapterName;
  final String chapterTitle;
  final String chapterApiData;

  ChapterLatestModel({
    required this.filename,
    required this.chapterName,
    required this.chapterTitle,
    required this.chapterApiData,
  });

  factory ChapterLatestModel.fromJson(Map<String, dynamic> json) {
    return ChapterLatestModel(
      filename: json['filename'] ?? '',
      chapterName: json['chapter_name'] ?? '',
      chapterTitle: json['chapter_title'] ?? '',
      chapterApiData: json['chapter_api_data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'chapter_name': chapterName,
      'chapter_title': chapterTitle,
      'chapter_api_data': chapterApiData,
    };
  }
}
