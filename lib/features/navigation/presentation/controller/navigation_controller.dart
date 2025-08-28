import 'package:auto_find/features/navigation/di/tab_profile_binding%20.dart';
import 'package:auto_find/features/navigation/presentation/page/tabs/tab_dashboard.dart';
import 'package:auto_find/features/navigation/presentation/page/tabs/tab_manage.dart';
import 'package:auto_find/features/navigation/presentation/page/tabs/tab_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt currentPage = 0.obs;

  List<String> routeNames = [
    const TabDashboard().routeName,
    const TabManage().routeName,
    const TabProfile().routeName,
  ];

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/tab-dashboard':
        return GetPageRoute(
          settings: settings,
          page: () => const TabDashboard(),
          transition: Transition.fadeIn,
        );
      case '/tab-manage':
        return GetPageRoute(
          settings: settings,
          page: () => const TabManage(),
          transition: Transition.fadeIn,
        );
      case '/tab-profile':
        return GetPageRoute(
          settings: settings,
          page: () => const TabProfile(),
          binding: TabProfileBinding(),
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
