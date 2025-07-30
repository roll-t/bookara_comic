import 'package:bookara/features/dashboard/dashboard_binding.dart';
import 'package:bookara/features/dashboard/dashboard_page.dart';
import 'package:bookara/features/management/management_binding.dart';
import 'package:bookara/features/management/management_page.dart';
import 'package:bookara/features/setting/di/setting_binding.dart';
import 'package:bookara/features/setting/presentation/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt currentPage = 0.obs;
  final RxString currentTitle = "Báo cáo".obs;

  List<String> routeNames = [
    DashboardPage.routeName,
    ManagementPage.routeName,
    SettingPage.routeName,
  ];

  Route? onGenerateRoute(RouteSettings settings,
      {BuildContext? parentContext}) {
    switch (settings.name) {
      case "/DashboardPage":
        return GetPageRoute(
          settings: settings,
          page: () => DashboardPage(
            parentContext: parentContext,
          ),
          binding: DashboardBinding(),
          transition: Transition.fadeIn,
        );
      case '/ManagementPage':
        return GetPageRoute(
          settings: settings,
          page: () => const ManagementPage(),
          binding: ManagementBinding(),
          transition: Transition.fadeIn,
        );
      case '/settings':
        return GetPageRoute(
          settings: settings,
          page: () => const SettingPage(),
          binding: SettingBinding(),
          transition: Transition.fadeIn,
        );
    }
    return null;
  }

  void onChangeItemBottomBar(int index) {
    if (currentPage.value == index) return;
    currentPage.value = index;
    Get.offAndToNamed(routeNames[index], id: 10);
  }
}
