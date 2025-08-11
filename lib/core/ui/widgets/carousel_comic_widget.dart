import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselComicWidget {
  static Widget buildCarouselSlider({
    required RxInt indexValue,
    required List<ComicModel> listComic,
    required Duration timeStep,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider.builder(
        itemCount: listComic.length,
        itemBuilder: (context, index, realIndex) {
          return Obx(() {
            final currentIndex = indexValue.value;
            final isCurrent = index == currentIndex;
            final double scale = isCurrent ? 1 : .9;

            return AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: isCurrent ? 1 : 0.6,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: ThumbnailWidget(
                      imageUrl: listComic[index].thumbUrl,
                    ),
                  ),
                ),
              ),
            );
          });
        },
        options: CarouselOptions(
          height: 350.0,
          viewportFraction: 0.6,
          autoPlay: true,
          autoPlayInterval: timeStep,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          onPageChanged: (index, reason) {
            indexValue.value = index;
          },
        ),
      ),
    );
  }
}
