import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/extension/datetime.dart';
import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/asset_image_widget.dart';
import 'package:bookara/core/ui/widgets/images/cache_image_widget.dart';
import 'package:bookara/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:bookara/core/ui/widgets/texts/expandable_text.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/core/utils/keyboard_utils.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_model.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:bookara/features/comic/presentation/argument/category_argument.dart';
import 'package:bookara/features/comic/presentation/argument/chapter_detail_argument.dart';
import 'package:bookara/features/comic/presentation/module/detail/controller/comic_detail_controller.dart';
import 'package:bookara/features/comic/presentation/module/detail/page/comic_read_page.dart';
import 'package:bookara/features/comic/presentation/module/category/page/comic_category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicDetailPage extends CustomStatePage {
  const ComicDetailPage({super.key});

  @override
  Widget buildBody(BuildContext context) => const _LoadingBodyHandling();
}

class _LoadingBodyHandling extends StatelessWidget {
  const _LoadingBodyHandling();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicDetailController>(
      id: 'COMIC_DETAIL_ID',
      builder: (controller) {
        if (controller.comicDetail == null) {
          return Center(
            child: Image.asset(
              AppImages.iLogoLoading,
              width: 35.w,
            ),
          );
        }
        return const _BodyBuilder();
      },
    );
  }
}

class _BodyBuilder extends GetView<ComicDetailController> {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyboardUtils.hiddenKeyboard,
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                backgroundColor: AppThemeColors.background200,
                title: Obx(
                  () {
                    return controller.isCollapsed.value
                        ? TextWidget(
                            text: (controller.comicDetail?.name).orNA(),
                            maxLines: 1,
                            textStyle: AppTextStyle.bold18,
                            textAlign: TextAlign.left,
                          )
                        : const SizedBox.shrink();
                  },
                ),
                centerTitle: false,
                leading: Center(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: .5,
                          color: AppColors.white.withValues(alpha: .8),
                        ),
                        color: AppColors.white.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 22,
                        weight: 700,
                      ),
                    ),
                  ),
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    final collapsed = constraints.biggest.height <=
                        kToolbarHeight + MediaQuery.of(context).padding.top;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (controller.isCollapsed.value != collapsed) {
                        controller.isCollapsed.value = collapsed;
                      }
                    });

                    return FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          CacheImageWidget(
                            width: double.infinity,
                            imageUrl: AppImages.iRootUrlApi +
                                (controller.comicDetail?.thumbUrl).orEmpty(),
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Container(
                              color: AppColors.black.withValues(alpha: .6),
                            ),
                          ),
                          if (!collapsed)
                            Positioned(
                              left: 20,
                              bottom: 20,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: TextWidget(
                                  text: (controller.comicDetail?.name).orNA(),
                                  maxLines: 3,
                                  textStyle: AppTextStyle.bold22,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    labelColor: AppThemeColors.secondary,
                    unselectedLabelColor: AppThemeColors.text,
                    indicatorColor: AppThemeColors.secondary,
                    dividerHeight: .5,
                    dividerColor: AppThemeColors.light300,
                    tabs: const [
                      Tab(
                        text: 'Thông tin',
                      ),
                      Tab(
                        text: 'Chương',
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              _BuildTabMainContentComicDetail(),
              _BuildTabChapters(),
            ],
          ),
        ),
      ),
    );
  }
}

// Delegate giữ TabBar khi cuộn
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppThemeColors.background300,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}

///---> [MAIN BODY CONTENT COMIC DETAILS]

class _BuildTabMainContentComicDetail extends StatelessWidget {
  const _BuildTabMainContentComicDetail();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicDetailController>(
      id: "COMIC_CONTENT",
      builder: (controller) {
        final ComicModel? comic = controller.comicDetail;
        if ((comic?.category?.isEmpty) ?? true) {
          return const SizedBox.shrink();
        }

        /// [RENDER-CASE]
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .5,
                      color: AppColors.text600,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "Thể loại",
                      textStyle: AppTextStyle.medium18,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          comic?.category?.length ?? 0,
                          (index) {
                            final CategoryComicModel? category =
                                comic?.category?[index];
                            return _BuildCategoryTag(category: category);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .5,
                      color: AppColors.text600,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "Nội dung",
                      textStyle: AppTextStyle.medium18,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ExpandableText(
                        text: (comic?.content).orNA(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _BuildCategoryTag extends StatelessWidget {
  final CategoryComicModel? category;

  const _BuildCategoryTag({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAndToNamed(
          const ComicCategoryPage().routeName,
          arguments: CategoryArgument(
            name: category?.name,
            slug: category?.slug,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppThemeColors.secondary.withValues(
            alpha: .3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextWidget(
          text: (category?.name).orNA(),
          color: AppThemeColors.secondary,
          textStyle: AppTextStyle.medium16,
        ),
      ),
    );
  }
}

class _BuildTabChapters extends GetView<ComicDetailController> {
  const _BuildTabChapters();

  @override
  Widget build(BuildContext context) {
    final comic = controller.comicDetail;
    final listChapter = (comic?.chapters?.isNotEmpty ?? false)
        ? comic!.chapters!.first.serverData ?? []
        : <ChapterModel>[];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildSearchBar(),
          if (listChapter.length >= 4) _buildRecentChapters(comic, listChapter),
          listChapter.isNotEmpty
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Danh sách",
                      textStyle: AppTextStyle.semiBold18,
                    ),
                  ],
                )
              : Expanded(
                  child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetImageWidget(
                        width: 25.w,
                        assetPath: AppImages.iEmpty,
                      ),
                      const SizedBox(height: 20),
                      const TextWidget(
                        text: "Chưa có chương nào",
                        size: 16,
                      ),
                    ],
                  ),
                )),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: controller.filteredChapters.length,
                itemBuilder: (_, index) => _buildChapterItem(
                  controller.filteredChapters[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildSearchBar() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      onChanged: (value) => controller.searchChapter(value),
      hintText: "Tìm kiếm chương",
      hintColor: AppColors.text400,
      focusedBorderColor: AppThemeColors.background100,
      borderColor: AppThemeColors.background100,
      textSize: 16,
      borderWidth: 0,
      backgroundColor: AppThemeColors.background100,
      borderRadius: 2000,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Utils.iconSvg(
          svgUrl: AppIcons.icSearch,
          color: AppColors.text400,
        ),
      ),
    );
  }

  Widget _buildRecentChapters(ComicModel? comic, List<ChapterModel> chapters) {
    final recentChapters =
        chapters.sublist(chapters.length - 4).reversed.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Gần nhất",
                textStyle: AppTextStyle.medium18,
              ),
              TextWidget(
                text: "Cập nhật ngày: ${comic?.updatedAt?.toVietnamTime()}",
                textStyle: AppTextStyle.regular14,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: recentChapters
                .map((chapter) => GestureDetector(
                      onTap: () {},
                      child: _buildChapterTag(chapter),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterTag(ChapterModel chapter) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          const ComicReadPage().routeName,
          arguments: ChapterDetailArgument(
            chapterApiData: chapter.chapterApiData,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.text300),
          color: AppThemeColors.background200,
        ),
        child: TextWidget(
          text: "Chương ${chapter.chapterName}",
          textStyle: AppTextStyle.regular16,
        ),
      ),
    );
  }

  Widget _buildChapterItem(ChapterModel chapter) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          const ComicReadPage().routeName,
          arguments: ChapterDetailArgument(
            chapterApiData: chapter.chapterApiData,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppThemeColors.background200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            TextWidget(
              text: "Chương ${(chapter.chapterName).orNA()}",
              textStyle: AppTextStyle.regular16,
            ),
          ],
        ),
      ),
    );
  }
}
