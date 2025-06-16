import 'dart:math';
import 'dart:ui' as ui;

import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/images/asset_image_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bookara/features/home/presentation/controller/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 30),
            _buildCategoryBar(),
            SpinnerWidget(controller: controller),

            ScaleTransition(
              scale: controller.scaleAnimation,
              child: InkWell(
                onTap: controller.onTapSpin,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppThemeColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ).copyWith(bottom: 15, top: 5),
                  child: TextWidget(
                    text: "Quay",
                    color: AppColors.white,
                    fontFamily: "PaytoneOne",
                    size: 26.sp,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Column _buildCategoryBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Utils.iconSvg(
                    svgUrl: AppIcons.icCategory,
                    size: 20,
                    color: AppThemeColors.primary,
                  ),
                  const SizedBox(width: 10),
                  const TextWidget(
                    text: "Danh mục",
                    fontWeight: FontWeight.bold,
                    size: 16,
                  ),
                ],
              ),
              InkWell(
                child: Row(
                  children: [
                    TextWidget(
                      text: "Tất cả",
                      color: AppThemeColors.primary,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppThemeColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppThemeColors.primary.withValues(alpha: 0.15),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppThemeColors.primary.withValues(alpha: 0.1),
                ),
                margin: EdgeInsets.only(left: index == 0 ? 20 : 15),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AssetImageWidget(
                        assetPath: AppImages.iLogo,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(child: TextWidget(text: "Danh mục", size: 14.sp)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Center _buildAppBar() {
    return const Center(
      child: Column(
        children: [AssetImageWidget(assetPath: AppImages.iLogo, width: 40)],
      ),
    );
  }
}

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "wheel_painter",
      builder:
          (_) => Expanded(
            child: Stack(
              children: [
                Center(
                  child: Obx(() {
                    return Transform.rotate(
                      angle: controller.rotationAngle.value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 90.w,
                            height: 90.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 1),
                            ),
                            child: CustomPaint(
                              painter: WheelPainter(controller.images),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppThemeColors.primary,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 13.w,
                          height: 13.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 6.w,
                        top: 0,
                        child: Center(
                          child: Utils.iconSvg(
                            svgUrl: AppIcons.icPointer,
                            size: 20.w,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppThemeColors.primary,
                            ),
                            width: 3.w,
                            height: 3.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<ui.Image> images;

  WheelPainter(this.images);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final parts = images.length;

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = AppColors.black.withValues(alpha: .1);

    for (int i = 0; i < parts; i++) {
      final angle = 2 * pi * i / parts;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      // Vẽ đường phân chia
      canvas.drawLine(center, Offset(x, y), paint);

      // Vẽ ảnh
      final image = images[i];
      final imgSize = 40.0;
      final imgOffset = Offset(
        center.dx + (radius - imgSize * 1.5) * cos(angle + pi / parts),
        center.dy + (radius - imgSize * 1.5) * sin(angle + pi / parts),
      );

      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromCenter(center: imgOffset, width: imgSize, height: imgSize),
        Paint(),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
