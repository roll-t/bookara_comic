import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/text_widget.dart';
import 'package:bookara/features/setting/controller/setting_controller.dart';
import 'package:bookara/features/theme/widget/select_primary_theme_widget.dart';
import 'package:bookara/features/theme/widget/toggle_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  static String routeName = "/settings";
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppContent.settings.tr)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildThemeOption(),
          const SizedBox(height: 12),
          _buildLanguageOption(),
          const SizedBox(height: 12),
          const SelectPrimaryThemeWidget(),
        ],
      ),
    );
  }

  Widget _buildThemeOption() {
    return _buildSettingContainer(
      title: 'Theme'.tr,
      trailing: const ToggleThemeWidget(),
      backgroundColor: AppThemeColors.background,
    );
  }

  Widget _buildLanguageOption() {
    return _buildSettingContainer(
      title: 'Language'.tr,
      trailing: DropdownButton<String>(
        value: controller.selectedLanguage.value,
        items:
            ['English', 'Vietnamese']
                .map(
                  (lang) => DropdownMenuItem(value: lang, child: Text(lang.tr)),
                )
                .toList(),
        onChanged: (value) => controller.setLanguage(value!),
        dropdownColor: AppThemeColors.background,
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: AppThemeColors.background),
      ),
      backgroundColor: AppThemeColors.background,
    );
  }

  Widget _buildSettingContainer({
    required String title,
    required Widget trailing,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [TextWidget(text: title), trailing],
      ),
    );
  }
}
