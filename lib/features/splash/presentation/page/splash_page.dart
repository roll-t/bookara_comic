import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/images/asset_image_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            return AnimatedPositioned(
              top: controller.top.value,
              left: controller.left.value,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutBack,
              child: Container(
                decoration: BoxDecoration(
                  color: AppThemeColors.primary.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                width: 500,
                height: 500,
              ),
            );
          }),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.easeInOutBack,
                    padding: EdgeInsets.only(
                      right: 150.0,
                      left: controller.logoPaddingLeft.value,
                    ),
                    child: ScaleTransition(
                      scale: controller.scaleAnimation,
                      child: const AssetImageWidget(
                        assetPath: AppImages.iLogo,
                        width: 80,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(() {
              return AnimatedOpacity(
                opacity: controller.textOpacity.value,
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: controller.logoPaddingLeft.value,
                    left: 180.0,
                  ),
                  child: SizedBox(
                    width: 500,
                    height: 10.h,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const TextWidget(
                            text: "Cần Thơ Ăn Gì?",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          AnimatedOpacity(
                            opacity: controller.loadOpacity.value,
                            duration: const Duration(milliseconds: 800),
                            child: LoadingAnimationWidget.progressiveDots(
                              size: 30,
                              color: AppThemeColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Obx(() {
            return AnimatedPositioned(
              right: controller.right.value,
              bottom: controller.bottom.value,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutBack,
              child: ScaleTransition(
                scale: controller.scaleCicelAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppThemeColors.primary,
                    shape: BoxShape.circle,
                  ),
                  width: 560,
                  height: 560,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
