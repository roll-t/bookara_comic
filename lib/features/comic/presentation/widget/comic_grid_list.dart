import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/card/comic_card.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:flutter/material.dart';

class ComicGridList extends StatelessWidget {
  final List<ComicModel> listComic;
  final String title;
  final String seeMoreText;
  final VoidCallback? onSeeMore;

  const ComicGridList({
    super.key,
    required this.title,
    required this.listComic,
    this.seeMoreText = "Xem thêm",
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    final int count = listComic.length > 9 ? 9 : listComic.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title & "See more"
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

        /// Grid 3x4
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: count,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            final comic = listComic[index];
            return ComicCard(
              comic: comic,
              isShowCategory: false,
            );
          },
        ),
      ],
    );
  }
}
