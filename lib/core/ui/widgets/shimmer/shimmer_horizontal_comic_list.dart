import 'package:bookara/core/ui/widgets/shimmer/shimmer_comic_card.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerComicHorizontalList extends StatelessWidget {
  final int lengthList;

  const ShimmerComicHorizontalList({
    super.key,
    this.lengthList = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: lengthList,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: const EdgeInsets.only(right: 12),
                child: const ShimmerComicCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
