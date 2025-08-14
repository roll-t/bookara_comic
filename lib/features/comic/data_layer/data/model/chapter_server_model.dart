import 'package:bookara/features/comic/data_layer/data/model/chapter_model.dart';

class ChapterServerModel {
  final String? serverName;
  final List<ChapterModel>? serverData;

  ChapterServerModel({
    this.serverName,
    this.serverData,
  });

  factory ChapterServerModel.fromJson(Map<String, dynamic> json) {
    return ChapterServerModel(
      serverName: json['server_name'],
      serverData: (json['server_data'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => ChapterModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'server_name': serverName,
      'server_data': serverData?.map((e) => e.toJson()).toList(),
    };
  }
}
