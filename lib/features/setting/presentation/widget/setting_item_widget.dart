import 'package:bookara/core/config/const/enum.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingItemWidget extends StatelessWidget {
  final String titleKey;
  final Widget trailing;
  final Color? backgroundColor;
  const SettingItemWidget({
    super.key,
    required this.titleKey,
    required this.trailing,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppThemeColors.background100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextWidget(
              text: titleKey.tr,
              transform: TextTransformType.capitalizeWords,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
