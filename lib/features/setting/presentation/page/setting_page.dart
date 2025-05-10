import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/const/app_dimens.dart';
import 'package:bookara/core/config/enum.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/text_widget.dart';
import 'package:bookara/features/setting/presentation/controller/setting_controller.dart';
import 'package:bookara/features/setting/presentation/widget/select_language_widget.dart';
import 'package:bookara/features/setting/presentation/widget/select_primary_theme_widget.dart';
import 'package:bookara/features/setting/presentation/widget/toggle_theme_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingPage extends GetView<SettingController> {
  static String routeName = "/settings";
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: AppContent.settings.tr,
          size: AppDimens.fontSizeAppBar,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildThemeOption(),
          const SizedBox(height: 12),
          _buildLanguageOption(),
          const SizedBox(height: 12),
          _buildPrimaryTheme(),
        ],
      ),
    );
  }

  Widget _buildPrimaryTheme() {
    return _buildSettingContainer(
      title: AppContent.theme.tr,
      trailing: SelectPrimaryThemeWidget(width: 30.w),
    );
  }

  Widget _buildThemeOption() {
    return _buildSettingContainer(
      title: AppContent.dark.tr,
      trailing: const ToggleThemeModeWidget(),
    );
  }

  Widget _buildLanguageOption() {
    return _buildSettingContainer(
      title: AppContent.language.tr,
      trailing: SelectLanguageWidget(controller: controller, width: 30.w),
    );
  }

  Widget _buildSettingContainer({
    required String title,
    required Widget trailing,
    Color? backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppThemeColors.background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextWidget(
              text: title,
              transform: TextTransformType.capitalizeWords,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
