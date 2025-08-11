import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:flutter/material.dart';

class ComicHorizontalList extends StatelessWidget {
  final List<ComicModel> listComic;
  final String title;
  final String seeMoreText;
  final VoidCallback? onSeeMore;

  const ComicHorizontalList({
    super.key,
    required this.title,
    required this.listComic,
    this.seeMoreText = "Xem thêm",
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextWidget(
                text: title,
                textStyle: AppTextStyle.bold18,
                padding: const EdgeInsets.only(left: 16),
              ),
            ),
            GestureDetector(
              onTap: onSeeMore,
              child: TextWidget(
                text: seeMoreText,
                textStyle: AppTextStyle.bold14,
                padding: const EdgeInsets.only(right: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: listComic.length,
            itemBuilder: (context, index) {
              final comic = listComic[index];
              return Container(
                width: 120,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ThumbnailWidget(imageUrl: comic.thumbUrl),
                    ),
                    const SizedBox(height: 6),
                    TextWidget(
                      text: comic.name,
                      textStyle: AppTextStyle.bold14,
                      maxLines: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
