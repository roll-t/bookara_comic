import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final rotationAngle = 0.0.obs;
  late AnimationController rotationController;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  final RxBool isSpinning = false.obs;
  final List<ui.Image> images = <ui.Image>[];

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
    loadAllImages(); // tải ảnh từ mạng
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

  Future<void> onTapSpin() async {
    if (isSpinning.value) return;
    isSpinning.value = true;

    // Scale effect
    await scaleController.forward();
    await scaleController.reverse();

    final random = Random();
    final spins = 5 + random.nextInt(4);
    final stopAngle = random.nextDouble() * 2 * pi;
    final targetAngle = 2 * pi * spins + stopAngle;

    final animation = Tween<double>(begin: 0.0, end: targetAngle).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeOutQuart),
    );

    animation.addListener(() {
      rotationAngle.value = animation.value;
    });

    await rotationController.forward(from: 0.0);

    isSpinning.value = false;
  }

  Future<void> loadAllImages() async {
    final urls = [
      "https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1551438228969-H0FPV1FO3W5B0QL328AS/chup-anh-thuc-an-1.jpg",
      "https://th.bing.com/th/id/OIP.MjXQ8F5-vQZWZNNcZvitYwHaFj?rs=1&pid=ImgDetMain",
      "https://th.bing.com/th/id/OIP.T_-593biEPSBZLNdzRMjRAHaHa?w=840&h=840&rs=1&pid=ImgDetMain",
      "https://simple-veganista.com/wp-content/uploads/2013/06/soba-noodle-stir-fry-4-680x910.jpg",
      "https://cdn.tgdd.vn/Files/2019/03/07/1153472/chinese-new-year_600x800.jpg",
      "https://confirmgood.com/wp-content/uploads/2022/10/67641668_467007407216086_5074179877325676359_n-844x1024.jpg",
      "https://tb-static.uber.com/prod/image-proc/processed_images/51e325b605bdf1f15f599259d6fca276/3ac2b39ad528f8c8c5dc77c59abb683d.jpeg",
    ];

    images.clear();
    images.addAll(await Future.wait(urls.map(loadUiImage)));
    update(["wheel_painter"]);
  }

  Future<ui.Image> loadUiImage(String url) async {
    final Completer<ui.Image> completer = Completer();
    final ImageStream stream = NetworkImage(
      url,
    ).resolve(const ImageConfiguration());

    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool _) {
        completer.complete(info.image);
        stream.removeListener(listener);
      },
      onError: (dynamic error, StackTrace? stackTrace) {
        completer.completeError(error, stackTrace);
        stream.removeListener(listener);
      },
    );

    stream.addListener(listener);
    return completer.future;
  }

  @override
  void onClose() {
    rotationController.dispose();
    scaleController.dispose();
    super.onClose();
  }
}
