import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingList extends StatelessWidget {
  final double heightItem;
  final int countItems;
  final EdgeInsets? padding;
  const ShimmerLoadingList({
    super.key,
    this.heightItem = 80,
    this.padding,
    required this.countItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: padding,
        itemCount: countItems,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Shimmer.fromColors(
            baseColor: AppColors.shimmerBase,
            highlightColor: AppColors.shimmerHighlight,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: heightItem,
              width: Get.width,
            ),
          ),
        ),
      ),
    );
  }
}
