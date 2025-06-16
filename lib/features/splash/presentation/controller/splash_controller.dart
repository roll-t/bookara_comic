import 'package:bookara/core/utils/mixin_controller/loading_mixin_controller.dart';
import 'package:bookara/features/main/presentation/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with LoadingMixinController, GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late AnimationController circleAnimationController;
  late Animation<double> scaleCicelAnimation;

  final RxDouble right = (-560.0).obs;
  final RxDouble logSize = (80.0).obs;
  final RxDouble bottom = (-560.0).obs;
  final RxDouble top = (-500.0).obs;
  final RxDouble left = (-500.0).obs;
  final RxDouble logoPaddingLeft = 150.0.obs;
  final RxDouble textOpacity = 0.0.obs;
  final RxDouble loadOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // Init animationController ngay từ đầu
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    circleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 150 / 80).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    scaleCicelAnimation = Tween<double>(begin: 1, end: 6).animate(
      CurvedAnimation(
        parent: circleAnimationController,
        curve: Curves.easeInOutBack,
      ),
    );

    // Delay để thực hiện animate vị trí hình tròn
    Future.delayed(const Duration(milliseconds: 100), () {
      animationController.forward();
      right.value = -300;
      bottom.value = -300;
      top.value = -280;
      left.value = -280;
    });

    // Delay chuyển logo sang trái sau 2.5s (sau khi scale xong)
    Future.delayed(const Duration(milliseconds: 2500), () {
      logoPaddingLeft.value = 0;
      // Kích hoạt opacity của text sau 200ms
      Future.delayed(const Duration(milliseconds: 1000), () {
        textOpacity.value = 1.0;
        Future.delayed(const Duration(milliseconds: 300), () {
          loadOpacity.value = 1.0;
          Future.delayed(const Duration(milliseconds: 2000), () {
            circleAnimationController.forward();
            Future.delayed(const Duration(milliseconds: 2000), () {
              Get.offAllNamed(MainPage.routeName);
            });
          });
        });
      });
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
