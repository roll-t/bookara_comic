import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/config/theme/app_theme_colors.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/buttons/primary_button.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/features/user/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends GetView<ProfileController> {
  const _BodyBuilder();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppThemeColors.background200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.light300,
              ),
              color: AppColors.cardBackground2,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              TextWidget(
                text: "Ten tai khoan",
                color: AppThemeColors.text,
                textStyle: AppTextStyle.medium18,
              ),
              const SizedBox(height: 12.0),
              PrimaryButton(
                text: "Đăng xuất",
                onPressed: controller.onLogOut,
              )
            ],
          )
        ],
      ),
    );
  }
}
