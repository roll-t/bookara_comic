import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/feature_configs.dart';
import 'package:bookara/features/setting/presentation/controller/setting_controller.dart';
import 'package:bookara/features/setting/presentation/widget/select_language_widget.dart';
import 'package:bookara/features/setting/presentation/widget/select_primary_theme_widget.dart';
import 'package:bookara/features/setting/presentation/widget/setting_item_widget.dart';
import 'package:bookara/features/setting/presentation/widget/toggle_theme_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BodyBuilder();
  }
}

///---> [Body-builder]
class BodyBuilder extends GetView<SettingController> {
  const BodyBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: _buildSettingsList(),
    );
  }

  ///---> [List-feature-setting]
  List<Widget> _buildSettingsList() {
    final List<Widget> widgets = [];
    if (FeatureConfigs.isThemeSwitchEnabled) {
      widgets.addAll([
        const SettingItemWidget(
          titleKey: AppContent.dark,
          trailing: ToggleThemeModeWidget(),
        ),
        const SizedBox(height: 12),
        SettingItemWidget(
          titleKey: AppContent.theme,
          trailing: SelectPrimaryThemeWidget(width: 30.w),
        ),
        const SizedBox(height: 12),
      ]);
    }

    if (FeatureConfigs.isSwitchLanguageEnabled) {
      widgets.addAll([
        SettingItemWidget(
          titleKey: AppContent.language,
          trailing: SelectLanguageWidget(controller: controller, width: 30.w),
        ),
        const SizedBox(height: 12),
      ]);
    }

    if (FeatureConfigs.isNotificationEnabled) {
      widgets.add(
        Obx(
          () => SettingItemWidget(
            titleKey: 'notification',
            trailing: Switch(
              value: controller.isNotificationEnabled.value,
              onChanged: controller.toggleNotification,
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}
