import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class navigation widget
class NavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const NavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    Color? primaryColor = Theme.of(context).navigationBarTheme.backgroundColor;
    return CircleNavBar(
      activeIcons: [
        Icon(Icons.category, color: primaryColor),
        Icon(Icons.home, color: primaryColor),
        Icon(Icons.settings, color: primaryColor),
      ],
      inactiveIcons: [
        Text(AppContent.category.tr),
        Text(AppContent.home.tr),
        Text(AppContent.settings.tr),
      ],
      color: Colors.white,
      height: 60,
      circleWidth: 60,
      activeIndex: currentIndex,
      onTap: onChange,
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      shadowColor: primaryColor ?? AppColors.background2,
      elevation: 10,
    );
  }
}
