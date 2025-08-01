import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/navigation/presentation/controller/tabs/profile_controller.dart';
import 'package:bookara/features/setting/presentation/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabProfile extends PageStatelessWidget {
  const TabProfile({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const _BodyBuilder();
  }
}

///---> [Theme]
class _BodyBuilder extends GetView<ProfileController> {
  const _BodyBuilder();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ColoredBox(
          color: AppThemeColors.background300,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const InfoProfileWidget(),
              const SizedBox(height: 20),
              SettingPage(
                themeController: controller.themeController,
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppThemeColors.background200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.light300,
              ),
              color: AppColors.cardBackground2,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              TextWidget(
                text: "Ten tai khoan",
                color: AppThemeColors.text,
                textStyle: AppTextStyle.medium16,
              )
            ],
          )
        ],
      ),
    );
  }
}
