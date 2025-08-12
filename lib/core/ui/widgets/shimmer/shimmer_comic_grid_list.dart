import 'package:bookara/core/ui/widgets/shimmer/shimmer_comic_card.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerComicGridList extends StatelessWidget {
  const ShimmerComicGridList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title & "See more"
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: ShimmerWidget(
                height: 18,
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: ShimmerWidget(
                height: 14,
                width: 80,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        /// Grid 3x4
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            return const ShimmerComicCard(
              isShowCategory: false,
            );
          },
        ),
      ],
    );
  }
}
