import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/presentation/argument/comic_argument.dart';
import 'package:bookara/features/comic/presentation/widget/category_tag.dart';
import 'package:bookara/features/comic/presentation/module/detail/page/comic_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicRowCard extends StatelessWidget {
  const ComicRowCard({
    super.key,
    required this.comic,
  });

  final ComicModel comic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          const ComicDetailPage().routeName,
          arguments: ComicArgument(
            name: comic.name,
            slug: comic.slug,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppThemeColors.background200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 110,
              child: ThumbnailWidget(imageUrl: comic.thumbUrl.orEmpty()),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: TextWidget(
                        text: comic.name.orEmpty(),
                        textStyle: AppTextStyle.regular16,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CategoryTag(
                          tagName: comic.category![0].name,
                          slug: comic.category![0].slug,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
