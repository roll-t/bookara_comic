import 'package:bookara/core/config/const/app_content.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/features/main/presentation/controller/main_controller.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  static String routeName = "/main";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(10),
        initialRoute: "/home",
        onGenerateRoute: controller.onGenerateRoute,
      ),

      bottomNavigationBar: Obx(() {
        return _buildBottomNav(context);
      }),
    );
  }

  CircleNavBar _buildBottomNav(BuildContext context) {
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
      activeIndex: controller.currentPage.value,
      onTap: (index) {
        controller.onChangeItemBottomBar(index);
      },
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      shadowColor: primaryColor ?? AppColors.background2,
      elevation: 10,
    );
  }
}
