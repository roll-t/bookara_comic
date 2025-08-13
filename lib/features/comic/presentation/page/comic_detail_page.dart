import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/images/cache_image_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/controller/comic_detail_controller.dart';
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
        if (controller.comicDetail.value == null) {
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
    return DefaultTabController(
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
                          text: (controller.comicDetail.value?.name).orNA(),
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
                              (controller.comicDetail.value?.thumbUrl)
                                  .orEmpty(),
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
                                text:
                                    (controller.comicDetail.value?.name).orNA(),
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

            // TabBar dưới AppBar
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

        // Nội dung của từng tab
        body: const TabBarView(
          children: [
            // Tab Thông tin
            Center(child: Text('Nội dung Thông tin')),
            // Tab Chương
            Center(child: Text('Danh sách Chương')),
          ],
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
