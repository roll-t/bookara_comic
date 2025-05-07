import 'package:bookara/features/home/presentation/controller/home_controller.dart';
import 'package:bookara/features/home/presentation/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: Obx(() {
        return NavigationBarWidget(
          currentPage: controller.currentPage.value,
          onChange: (index) {
            controller.onChangePage(index);
          },
        );
      }),
    );
  }
}
