import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/carousel_comic_widget.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/images/thumbnail_widget.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
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
        _BuildCommingSoonComics(),
        SizedBox(height: 40),
        _BuildCommingSoonComics(),
        SizedBox(height: 40),
        _BuildCommingSoonComics(),
      ],
    );
  }
}

class _BuildCommingSoonComics extends StatelessWidget {
  const _BuildCommingSoonComics();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "LIST_COMMING_SOON_ID",
      builder: (controller) {
        return ComicHorizontalList(
          title: "Sắp ra mắt",
          onSeeMore: () {
            print("Nhấn xem thêm");
          },
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
                  height: 360,
                ),
              ),
              SizedBox(width: 10),
              ShimmerWidget(
                height: 400,
                width: 280,
              ),
              SizedBox(width: 10),
              Expanded(
                child: ShimmerWidget(
                  height: 350,
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
