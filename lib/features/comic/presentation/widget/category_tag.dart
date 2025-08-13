import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/comic/presentation/argument/category_argument.dart';
import 'package:bookara/features/comic/presentation/page/comic_category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTag extends StatelessWidget {
  final String tagName;
  final String slug;
  final AppTextStyle? textStyle;
  final void Function()? onTap;
  const CategoryTag({
    super.key,
    required this.tagName,
    required this.slug,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.toNamed(
              const ComicCategoryPage().routeName,
              arguments: CategoryArgument(
                slug: slug,
                name: tagName,
              ),
            );
          },
      child: Container(
        decoration: BoxDecoration(
          color: AppThemeColors.background100,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: TextWidget(
          textAlign: TextAlign.center,
          color: AppThemeColors.text200,
          text: tagName,
          textStyle: AppTextStyle.regular12,
        ),
      ),
    );
  }
}
