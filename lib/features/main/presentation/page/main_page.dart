import 'package:bookara/features/main/presentation/controller/main_controller.dart';
import 'package:bookara/features/main/presentation/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  static String routeName = "/main";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(), bottomNavigationBar: _buildNav());
  }

  Navigator _buildBody() {
    return Navigator(
      key: Get.nestedKey(10),
      initialRoute: "/home",
      onGenerateRoute: controller.onGenerateRoute,
    );
  }

  Obx _buildNav() {
    return Obx(() {
      return NavigationBarWidget(
        currentIndex: controller.currentPage.value,
        onChange: (index) {
          controller.onChangeItemBottomBar(index);
        },
      );
    });
  }
}
