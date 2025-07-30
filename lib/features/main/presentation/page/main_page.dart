import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/widgets/dialogs/dialog_utils.dart';
import 'package:bookara/features/dashboard/dashboard_page.dart';
import 'package:bookara/features/main/presentation/controller/main_controller.dart';
import 'package:bookara/features/main/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  static String routeName = "/main";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          DialogUtils.showCustomExitConfirm();
        }
      },
      child: Scaffold(
        body: Navigator(
          key: Get.nestedKey(10),
          initialRoute: DashboardPage.routeName,
          onGenerateRoute: (settings) => controller.onGenerateRoute(
            settings,
            parentContext: context,
          ),
        ),
        bottomNavigationBar: controller.currentPage.obx(
          onData: (value) {
            return BottomNavigationBarWidget(
              currentIndex: value,
              selectedItemColor: AppColors.primary1_500,
              onChange: (int index) {
                controller.onChangeItemBottomBar(index);
              },
            );
          },
        ),
      ),
    );
  }
}
