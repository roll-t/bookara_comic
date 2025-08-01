import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/feature_configs.dart';
import 'package:bookara/features/setting/presentation/controller/setting_controller.dart';
import 'package:bookara/features/setting/presentation/widget/select_language_widget.dart';
import 'package:bookara/features/setting/presentation/widget/select_primary_theme_widget.dart';
import 'package:bookara/features/setting/presentation/widget/setting_item_widget.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingPage extends StatelessWidget {
  final ThemeController themeController;
  const SettingPage({
    super.key,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) => _BodyBuilder(
        themeController: themeController,
      );
}

class _BodyBuilder extends GetView<SettingController> {
  final ThemeController themeController;
  const _BodyBuilder({
    required this.themeController,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: _buildSettingsList(),
      ),
    );
  }

  List<Widget> _buildSettingsList() {
    final items = <Widget>[];
    void addSetting(Widget widget) {
      if (items.isNotEmpty) items.add(const SizedBox(height: 12));
      items.add(widget);
    }

    if (FeatureConfigs.isThemeSwitchEnabled) {
      addSetting(
        SettingItemWidget(
          titleKey: AppContent.dark,
          trailing: Switch(
            value: themeController.themeMode == ThemeMode.dark,
            onChanged: (_) => themeController.toggleTheme(),
          ),
        ),
      );
      addSetting(
        SettingItemWidget(
          titleKey: AppContent.theme,
          trailing: SelectPrimaryThemeWidget(width: 30.w),
        ),
      );
    }

    if (FeatureConfigs.isSwitchLanguageEnabled) {
      addSetting(
        SettingItemWidget(
          titleKey: AppContent.language,
          trailing: SelectLanguageWidget(
            controller: controller,
            width: 30.w,
          ),
        ),
      );
    }

    if (FeatureConfigs.isNotificationEnabled) {
      addSetting(
        SettingItemWidget(
          titleKey: 'notification',
          trailing: Switch(
            value: controller.isNotificationEnabled.value,
            onChanged: controller.toggleNotification,
          ),
        ),
      );
    }

    return items;
  }
}
