import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/config/theme/app_theme_colors.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool titleCenter;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.actions,
    this.showBackButton = true,
    this.titleCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppThemeColors.appBar,
      leading: showBackButton && Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            )
          : null,
      title: titleWidget ??
          TextWidget(
            text: title?.tr ?? "",
            textStyle: AppTextStyle.medium20,
            color: AppColors.white,
          ),
      centerTitle: titleCenter,
      actions: actions,
      elevation: 0,
      foregroundColor: AppColors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
