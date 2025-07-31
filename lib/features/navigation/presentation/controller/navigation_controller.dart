import 'package:bookara/features/navigation/presentation/page/tabs/tab_bookcase.dart';
import 'package:bookara/features/navigation/presentation/page/tabs/tab_comic_collection.dart';
import 'package:bookara/features/navigation/presentation/page/tabs/tab_profile.dart';
import 'package:bookara/features/setting/di/setting_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt currentPage = 0.obs;
  final RxString currentTitle = "Báo cáo".obs;

  List<String> routeNames = [
    const TabComicCollection().routeName,
    const TabBookcase().routeName,
    const TabProfile().routeName,
  ];

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/tab-comic-collection":
        return GetPageRoute(
          settings: settings,
          page: () => const TabComicCollection(),
          transition: Transition.fadeIn,
        );
      case '/tab-bookcase':
        return GetPageRoute(
          settings: settings,
          page: () => const TabBookcase(),
          transition: Transition.fadeIn,
        );
      case '/tab-profile':
        return GetPageRoute(
          settings: settings,
          page: () => const TabProfile(),
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
