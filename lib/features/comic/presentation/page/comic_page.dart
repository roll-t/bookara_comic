import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/bottom_sheet/get_bottom_sheet_body.dart';
import 'package:bookara/core/ui/widgets/carousel_comic_widget.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_comic_grid_list.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_horizontal_comic_list.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/comic/presentation/argument/category_argument.dart';
import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:bookara/features/comic/presentation/page/comic_category_page.dart';
import 'package:bookara/features/comic/presentation/page/comic_explore_page.dart';
import 'package:bookara/features/comic/presentation/widget/category_tag.dart';
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
      isLeadingAppBar: false,
      appBar: _BuildAppBarComic(),
      bodyBuilder: _BuildBodyComicCollection(),
    );
  }
}

///=============================== [RENDER APP BAR PAGE] ====================================
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

///=============================== [RENDER MAIN BODY CONTENT] ====================================
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
        _BuildCategory(),
        _BuildCompletedComics(),
        SizedBox(height: 40),
        _BuildExplore()
      ],
    );
  }
}

class _BuildExplore extends StatelessWidget {
  const _BuildExplore();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(const ComicExplorePage().routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
          color: AppThemeColors.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.iconSvg(
              svgUrl: AppIcons.icBook,
              color: AppThemeColors.text,
              size: 24,
            ),
            const SizedBox(width: 10),
            TextWidget(
              text: "Khám phá thêm truyện",
              textStyle: AppTextStyle.regular16,
              color: AppThemeColors.text,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildCategory extends StatelessWidget {
  const _BuildCategory();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      id: "CATEGORY_COMICS_ID",
      builder: (controller) {
        ///---> [EMPTY-CASE]
        if (controller.listCategory.isEmpty) {
          return const SizedBox.shrink();
        }

        const int maxLength = 15;
        final listCategory = controller.listCategory;
        final count =
            listCategory.length > maxLength ? maxLength : listCategory.length;

        ///---> [RENDER-CASE]
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: "Danh mục truyện",
              textStyle: AppTextStyle.bold18,
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(count, (index) {
                final category = listCategory[index];
                if (index == maxLength - 1) {
                  return CategoryTag(
                    slug: category.slug,
                    tagName: "+ Xem thêm",
                    onTap: () {
                      Get.bottomSheet(
                        const _CategoryBottomSheet(),
                        isScrollControlled: true,
                      );
                    },
                  );
                }
                return CategoryTag(
                  tagName: category.name,
                  slug: category.slug,
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}

class _CategoryBottomSheet extends StatelessWidget {
  const _CategoryBottomSheet();

  @override
  Widget build(BuildContext context) {
    return GetBottomSheetBody(
      bodyBuilder: GetBuilder<ComicController>(
        id: "CATEGORY_COMICS_ID",
        builder: (controller) {
          ///---> [EMPTY-CASE]
          if (controller.listCategory.isEmpty) {
            return const SizedBox.shrink();
          }

          ///---> [RENDER-CASE]
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppThemeColors.text,
                        size: 18,
                      ),
                    ),
                  ),
                  const TextWidget(
                    text: "Danh mục truyện",
                    textStyle: AppTextStyle.bold18,
                  ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: controller.listCategory.length,
                  itemBuilder: (context, index) {
                    final category = controller.listCategory[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          const ComicCategoryPage().routeName,
                          arguments: CategoryArgument(
                            slug: category.slug,
                            name: category.name,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppThemeColors.background200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: category.name,
                            maxLines: 1,
                            textStyle: AppTextStyle.medium16,
                            color: AppThemeColors.text,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
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
            Get.toNamed(
              const ComicCategoryPage().routeName,
              arguments: CategoryArgument(
                slug: "truyen-moi",
                name: "Truyện mới nhất",
              ),
            );
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
          onSeeMore: () {
            Get.toNamed(
              const ComicCategoryPage().routeName,
              arguments: CategoryArgument(
                slug: "dang-phat-hanh",
                name: "Đang phát hành",
              ),
            );
          },
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
          onSeeMore: () {
            Get.toNamed(
              const ComicCategoryPage().routeName,
              arguments: CategoryArgument(
                slug: "hoan-thanh",
                name: "Hoàn thành",
              ),
            );
          },
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
          onSeeMore: () {
            Get.toNamed(
              const ComicCategoryPage().routeName,
              arguments: CategoryArgument(
                slug: "sap-ra-mat",
                name: "Sắp ra mắt",
              ),
            );
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
