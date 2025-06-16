import 'package:bookara/core/extension/duration_extensions.dart';
import 'package:bookara/core/utils/mixin_controller/loading_mixin_controller.dart';
import 'package:bookara/features/main/presentation/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashController extends GetxController
    with LoadingMixinController, GetTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final AnimationController circleAnimationController;
  late final Animation<double> scaleCircleAnimation;
  final Rx<SplashAnimationState> state = SplashAnimationState().obs;

  @override
  void onInit() {
    super.onInit();
    _initAnimations(); 
    _startSequence();
  }

  void _initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 150 / 80).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    circleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    scaleCircleAnimation = Tween<double>(begin: 1, end: 4).animate(
      CurvedAnimation(parent: circleAnimationController, curve: Curves.easeInOutBack),
    );
  }

  void _startSequence() async {
    await Future.delayed(100.ms);
    animationController.forward();
    state.update((s) {
      s?.right = -300;
      s?.bottom = -300;
      s?.top = -280;
      s?.left = -280;
    });

    await Future.delayed(2500.ms);
    state.update((s) => s?.logoPaddingLeft = 0);

    await Future.delayed(1000.ms);
    state.update((s) => s?.textOpacity = 1);

    await Future.delayed(300.ms);
    state.update((s) => s?.loadOpacity = 1);

    await Future.delayed(2000.ms);
    circleAnimationController.forward();

    await Future.delayed(1000.ms);
    Get.offAllNamed(MainPage.routeName);
  }

  @override
  void onClose() {
    animationController.dispose();
    circleAnimationController.dispose();
    super.onClose();
  }
}

class SplashAnimationState {
  double right = -560;
  double bottom = -560;
  double top = -500;
  double left = -500;
  double logoPaddingLeft = 150;
  double textOpacity = 0;
  double loadOpacity = 0;
}
