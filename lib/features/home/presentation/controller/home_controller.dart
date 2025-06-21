import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final rotationAngle = 0.0.obs;
  late final AnimationController rotationController;
  late final AnimationController scaleController;
  late final Animation<double> scaleAnimation;

  final RxBool isSpinning = false.obs;
  final List<ui.Image> images = <ui.Image>[];

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
  }

  void _initAnimations() {
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOutBack),
    );

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void onClose() {
    rotationController.dispose();
    scaleController.dispose();
    super.onClose();
  }
}
