import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:bookara/features/navigation/presentation/page/tabs/tab_comic_collection.dart';
import 'package:bookara/features/navigation/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends PageStatelessWidget {
  const NavigationPage({super.key});

  ///---> [Build-bottom-navigation]
  @override
  Widget? get bottomNavigationBar => _buildBottomNavigationBar();

  ///---> [Build-body]
  @override
  Widget buildBody(BuildContext context) {
    return const BodyBuilder();
  }

  ///---> [Bottom-navigation-bar]
  GetBuilder<NavigationController> _buildBottomNavigationBar() {
    return GetBuilder<NavigationController>(
      builder: (controller) => controller.currentPage.obx(
        onData: (index) => BottomNavigationBarWidget(
          currentIndex: index,
          selectedItemColor: AppThemeColors.iconActive,
          onChange: (int index) {
            controller.onChangeItemBottomBar(index);
          },
        ),
      ),
    );
  }
}

///---> [Body-builder]
class BodyBuilder extends GetView<NavigationController> {
  const BodyBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(10),
      initialRoute: const TabComicCollection().routeName,
      onGenerateRoute: (settings) => controller.onGenerateRoute(settings),
    );
  }
}
