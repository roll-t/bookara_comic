import 'package:bookara/features/comic/data_layer/data/model/chapter_model.dart';

class ChapterDetailArgument {
  final List<ChapterModel>? listChapter;
  final String? chapterApiData;

  ChapterDetailArgument({
    this.chapterApiData,
    this.listChapter,
  });
}
