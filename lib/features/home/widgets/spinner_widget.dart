import 'dart:math';
import 'dart:ui' as ui;

import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/home/presentation/controller/spinner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpinnerController>(
      id: "wheel_painter",
      builder: (controller) {
        final foodList = controller.foodList;
        final images = controller.images;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
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
                            child:
                                images.length == foodList.length
                                    ? CustomPaint(
                                      painter: WheelPainterWidget(
                                        images,
                                        foodList.map((e) => e.title).toList(),
                                      ),
                                    )
                                    : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                _buildCenterPointer(),
              ],
            ),
            SizedBox(height: 6.h),
            ScaleTransition(
              scale: controller.scaleAnimation,
              child: InkWell(
                onTap: () async {
                  await controller.onTapSpin(
                    onCompleted: (food) {
                      Get.snackbar("🎉 Kết quả", "Bạn đã trúng: ${food.title}");
                    },
                  );
                },
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
          ],
        );
      },
    );
  }

  Widget _buildCenterPointer() {
    return Positioned.fill(
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
            child: Container(
              width: 3.w,
              height: 3.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemeColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WheelPainterWidget extends CustomPainter {
  final List<ui.Image> images;
  final List<String> foodTitles;

  WheelPainterWidget(this.images, this.foodTitles);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final parts = images.length;
    final sweepAngle = 2 * pi / parts;

    for (int i = 0; i < parts; i++) {
      final startAngle = sweepAngle * i;
      final midAngle = startAngle + sweepAngle / 2;

      // _drawSectorImage(
      //   canvas,
      //   center,
      //   radius,
      //   images[i],
      //   startAngle,
      //   sweepAngle,
      // );
      _drawSectorTitle(canvas, center, radius, foodTitles[i], midAngle);
      _drawSectorIndex(canvas, center, radius, i, midAngle);
    }

    _drawBorders(canvas, center, radius, parts);
  }

  void _drawSectorImage(
    Canvas canvas,
    Offset center,
    double radius,
    ui.Image image,
    double startAngle,
    double sweepAngle,
  ) {
    final path =
        Path()
          ..moveTo(center.dx, center.dy)
          ..arcTo(
            Rect.fromCircle(center: center, radius: radius),
            startAngle,
            sweepAngle,
            false,
          )
          ..close();

    canvas.save();
    canvas.clipPath(path);

    // Góc giữa của sector
    final midAngle = startAngle + sweepAngle / 2;

    // Di chuyển canvas đến giữa sector
    canvas.translate(center.dx, center.dy);
    canvas.rotate(midAngle);
    canvas.translate(radius * 0.45, 0); // dịch ra ngoài

    final imageSize = radius * 0.5;
    final imageRect = Rect.fromCenter(
      center: Offset.zero,
      width: imageSize,
      height: imageSize,
    );

    final srcRect = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );

    canvas.drawImageRect(image, srcRect, imageRect, Paint());

    canvas.restore();
  }

  void _drawSectorTitle(
    Canvas canvas,
    Offset center,
    double radius,
    String text,
    double angle,
  ) {
    final textRadius = radius * 0.6;
    final words = text.split(' ');

    final wordPainters =
        words.map((word) {
          return TextPainter(
            text: TextSpan(
              text: word,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
        }).toList();

    final totalHeight =
        wordPainters.fold(0.0, (sum, tp) => sum + tp.height + 4) - 4;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    canvas.translate(0, -textRadius);

    double currentY = -totalHeight / 2;
    for (final tp in wordPainters) {
      tp.paint(canvas, Offset(-tp.width / 2, currentY));
      currentY += tp.height + 4;
    }

    canvas.restore();
  }

  void _drawSectorIndex(
    Canvas canvas,
    Offset center,
    double radius,
    int index,
    double angle,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: index.toString(),
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(offset: Offset(1, 1), blurRadius: 3, color: Colors.black),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final offsetRadius = radius * 0.82;
    final offset = Offset(
      center.dx + offsetRadius * cos(angle) - textPainter.width / 2,
      center.dy + offsetRadius * sin(angle) - textPainter.height / 2,
    );

    textPainter.paint(canvas, offset);
  }

  void _drawBorders(Canvas canvas, Offset center, double radius, int parts) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    for (int i = 0; i < parts; i++) {
      final angle = 2 * pi * i / parts - pi / 2;
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(center, point, paint);
    }

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
