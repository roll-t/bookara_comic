
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderBarWidget extends StatelessWidget {
  final RxDouble sliderValue;
  const SliderBarWidget({
    super.key,
    required this.sliderValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Chọn số lượng truyện",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Obx(
          () => Slider(
            value: sliderValue.value,
            min: 0,
            max: 100,
            divisions: 100,
            label: sliderValue.value.toStringAsFixed(0),
            onChanged: (value) {
              sliderValue.value = value;
            },
          ),
        ),
        Obx(
          () => Text(
            "Giá trị hiện tại: ${sliderValue.value.toStringAsFixed(0)}",
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
