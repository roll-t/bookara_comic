import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.dark700,
      body: Center(
        child: Image.asset(
          AppImages.iLogoLoading,
          width: 40.w,
        ),
      ),
    );
  }
}
