import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerComicCard extends StatelessWidget {
  final bool isShowCategory;

  const ShimmerComicCard({
    super.key,
    this.isShowCategory = true,
  });

  @override
  Widget build(BuildContext context) {
    final Widget categoryItem =
        isShowCategory ? const _CategoryTagItem() : const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 6,
          child: ShimmerWidget(
            height: 300,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: isShowCategory ? 3 : 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  ShimmerWidget(
                    height: 12,
                    width: 100,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget(
                    height: 12,
                    width: 100,
                  )
                ],
              ),
              categoryItem
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryTagItem extends StatelessWidget {
  const _CategoryTagItem();

  @override
  Widget build(BuildContext context) {
    return const ShimmerWidget(
      height: 20,
      width: 60,
    );
  }
}
