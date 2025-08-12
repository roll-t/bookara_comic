import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/carousel_comic_widget.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_comic_grid_list.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_horizontal_comic_list.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:bookara/features/comic/presentation/widget/comic_grid_list.dart';
import 'package:bookara/features/comic/presentation/widget/horizontal_comic_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicPage extends StatelessWidget {
  const ComicPage({super.key});
  @override
  Widget build(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends StatelessWidget {
  const _BodyBuilder();
  @override
  Widget build(BuildContext context) {
    return const CustomSliverLayout(
      appBar: _BuildAppBarComic(),
      bodyBuilder: _BuildBodyComicCollection(),
    );
  }     
}

class _BuildAppBarComic extends StatelessWidget {
  const _BuildAppBarComic();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 70.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: "Xin chào",
                    textStyle: AppTextStyle.semiBold16,
                    color: AppThemeColors.text,
                  ),
                  const SizedBox(width: 4),
                  const TextWidget(text: "👋"),
                ],
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: "Phạm Phước Trường",
                textStyle: AppTextStyle.bold18,
                color: AppThemeColors.text,
                maxLines: 1,
              )
            ],
          ),
        ),
        Utils.iconSvg(
          svgUrl: AppIcons.icSearch,
          color: AppThemeColors.text,
        )
      ],
    );
  }
}

class _BuildBodyComicCollection extends StatelessWidget {
  const _BuildBodyComicCollection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _BuilderCarousel(),
        SizedBox(height: 20),
        _BuildNewReleaseComics(),
        SizedBox(height: 40),
        _BuildComingSoonComics(),
        SizedBox(height: 40),
        _BuildOngoingComics(),
        SizedBox(height: 40),
        _BuildCompletedComics(),
      ],
    );
  }
}

class _BuildNewReleaseComics extends StatelessWidget {
  const _BuildNewReleaseComics();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "NEW_RELEASE_COMICS_ID",
      builder: (controller) {
        ///---> [LOADING-CASE]
        if (controller.isLoadingNewRelease.value) {
          return const ShimmerComicHorizontalList();
        }

        ///---> [EMPTY-CASE]
        if (controller.listNewRelease.isEmpty) {
          return const SizedBox.shrink();
        }

        ///---> [RENDER-CASE]
        return ComicHorizontalList(
          title: "Mới nhất",
          onSeeMore: () {
            print("Nhấn xem thêm");
          },
          listComic: controller.listNewRelease,
        );
      },
    );
  }
}

class _BuildOngoingComics extends StatelessWidget {
  const _BuildOngoingComics();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "ON_GOING_COMICS_ID",
      builder: (controller) {
        ///---> [LOADING-CASE]
        if (controller.isLoadingOngoing.value) {
          return const ShimmerComicHorizontalList();
        }

        ///---> [EMPTY-CASE]
        if (controller.listOngoing.isEmpty) {
          return const SizedBox.shrink();
        }

        ///---> [RENDER-CASE]
        return ComicHorizontalList(
          title: "Đang phát hành",
          onSeeMore: () {},
          listComic: controller.listOngoing,
        );
      },
    );
  }
}

class _BuildCompletedComics extends StatelessWidget {
  const _BuildCompletedComics();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "COMPLETED_COMICS_ID",
      builder: (controller) {
        ///---> [LOADING-CASE]
        if (controller.isLoadingComplete.value) {
          return const ShimmerComicGridList();
        }

        ///---> [EMPTY-CASE]
        if (controller.listCompleted.isEmpty) {
          return const SizedBox.shrink();
        }

        ///---> [RENDER-CASE]
        return ComicGridList(
          title: "Hoàn thành",
          onSeeMore: () {},
          listComic: controller.listCompleted,
        );
      },
    );
  }
}

class _BuildComingSoonComics extends StatelessWidget {
  const _BuildComingSoonComics();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "COMING_SOON_ID",
      builder: (controller) {
        ///---> [LOADING-CASE]
        if (controller.isLoadingComingSoon.value) {
          return const ShimmerComicGridList();
        }

        ///---> [EMPTY-CASE]
        if (controller.listComingSoon.isEmpty) {
          return const SizedBox.shrink();
        }

        ///---> [RENDER-CASE]
        return ComicGridList(
          title: 'Sắp ra mắt',
          listComic: controller.listComingSoon,
        );
      },
    );
  }
}

class _BuilderCarousel extends StatelessWidget {
  const _BuilderCarousel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "CAROUSEL_ID",
      builder: (controller) {
        ///---> [LOADING-CASE]
        if (controller.isLoadingCarousel.value) {
          return const Row(
            children: [
              Expanded(
                child: ShimmerWidget(
                  height: 300,
                ),
              ),
              SizedBox(width: 10),
              ShimmerWidget(
                height: 350,
                width: 280,
              ),
              SizedBox(width: 10),
              Expanded(
                child: ShimmerWidget(
                  height: 300,
                ),
              ),
            ],
          );
        }

        ///---> [EMPTY-CASE]
        if (controller.listHomeComic.isEmpty) {
          return const SizedBox.shrink();
        }

        ///---> [RENDER-CASE]
        return Container(
          child: CarouselComicWidget.buildCarouselSlider(
            indexValue: 0.obs,
            listComic: controller.listHomeComic,
            timeStep: const Duration(
              seconds: 6, //2s
            ),
          ),
        );
      },
    );
  }
}
