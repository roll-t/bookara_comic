import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {
  final bool isShowCategory;
  final ComicModel comic;

  const ComicCard({
    super.key,
    required this.comic,
    this.isShowCategory = true,
  });

  @override
  Widget build(BuildContext context) {
    final Widget categoryItem = isShowCategory ? _CategoryTagItem(categoryName: comic.category[0].name) : const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: ThumbnailWidget(imageUrl: comic.thumbUrl),
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: isShowCategory ? 3 : 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: comic.name,
                textStyle: AppTextStyle.bold14,
                maxLines: 2,
              ),
              categoryItem
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryTagItem extends StatelessWidget {
  final String categoryName;
  const _CategoryTagItem({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeColors.background100,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: TextWidget(
        color: AppThemeColors.text200,
        text: categoryName,
        textStyle: AppTextStyle.regular12,
      ),
    );
  }
}
