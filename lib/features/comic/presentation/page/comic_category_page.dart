import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/controller/comic_category_controller.dart';
import 'package:bookara/features/comic/presentation/widget/category_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicCategoryPage extends CustomStatePage {
  const ComicCategoryPage({super.key});

  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends GetView<ComicCategoryController> {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        controller: controller.scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: controller.listComicByCategory.length +
            (controller.isLoadingMore.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= controller.listComicByCategory.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final comic = controller.listComicByCategory[index];
          return Container(
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
                  height: 90,
                  width: 80,
                  child: ThumbnailWidget(imageUrl: comic.thumbUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: TextWidget(
                            text: comic.name,
                            textStyle: AppTextStyle.regular16,
                            maxLines: 2,
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            CategoryTag(
                              tagName: comic.category[0].name,
                              slug: comic.category[0].slug,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
