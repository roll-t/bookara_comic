import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:bookara/core/data/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpinnerController extends GetxController
    with GetTickerProviderStateMixin {
  SpinnerController({required this.foodList});
  final List<FoodModel> foodList;

  late final List<String> titles;
  late final List<String> imageUrls;
  final List<ui.Image> images = [];

  final rotationAngle = 0.0.obs;
  final isSpinning = false.obs;

  late final AnimationController rotationController;
  late final AnimationController scaleController;
  late final Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    titles = foodList.map((e) => e.title).toList();
    imageUrls = foodList.map((e) => e.imageUrl).toList();
    _initAnimations();
    _loadAllImages();
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
      duration: const Duration(seconds: 1),
    );
  }

  /// ✅ Gọi khi nhấn nút quay
  Future<void> onTapSpin({
    required Function(FoodModel food) onCompleted,
  }) async {
    if (isSpinning.value) return;

    isSpinning.value = true;

    await scaleController.forward();
    await scaleController.reverse();

    // 🎯 Random sẵn 1 index
    final randomIndex = Random().nextInt(foodList.length);
    await spinToIndex(targetIndex: randomIndex, onCompleted: onCompleted);
  }

  /// ✅ Quay đến đúng index
  Future<void> spinToIndex({
    required int targetIndex,
    required Function(FoodModel food) onCompleted,
  }) async {
    final sectorAngle = 2 * pi / foodList.length;
    print(sectorAngle);
    final stopAngle = targetIndex;
    final totalSpins = 5 + Random().nextInt(4);

    final targetAngle = 2 * pi * totalSpins + stopAngle - pi / 2;
    final animation = Tween<double>(begin: 0.0, end: targetAngle).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeOutQuart),
    );

    animation.addListener(() {
      rotationAngle.value = animation.value;
    });

    await rotationController.forward(from: 0.0);

    isSpinning.value = false;
    print("index $targetIndex");
    onCompleted(foodList[targetIndex]);
  }

  /// ✅ Tải ảnh từ URL hoặc trả về ảnh rỗng
  Future<void> _loadAllImages() async {
    images.clear();
    final futures = imageUrls.map(
      (url) => _loadImage(url).catchError((_) => _createEmptyImage()),
    );
    images.addAll(await Future.wait(futures));
    update(["wheel_painter"]);
  }

  Future<ui.Image> _loadImage(String url) {
    final completer = Completer<ui.Image>();
    final stream = NetworkImage(url).resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener(
        (info, _) => completer.complete(info.image),
        onError: (error, _) => completer.completeError(error),
      ),
    );
    return completer.future;
  }

  Future<ui.Image> _createEmptyImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = const Color(0x00000000);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 1, 1), paint);
    return recorder.endRecording().toImage(1, 1);
  }

  @override
  void onClose() {
    rotationController.dispose();
    scaleController.dispose();
    super.onClose();
  }
}
