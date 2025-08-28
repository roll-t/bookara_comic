import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/comic/data_layer/data/model/chapter_model.dart';
import 'package:bookara/features/comic/presentation/module/detail/controller/comic_read_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicReadPage extends CustomStatePage {
  const ComicReadPage({super.key});
  @override
  Widget? get drawer => const _BuilderDrawer();

  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BuilderDrawer extends StatelessWidget {
  const _BuilderDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  keyboardType: TextInputType.number,
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
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: TextWidget(
                    text: "Danh sách chương",
                    textStyle: AppTextStyle.medium18,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<ComicReadController>(
              id: "CHAPTER_SELECTED",
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 50),
                    itemCount: controller.argsData?.listChapter?.length,
                    itemBuilder: (_, index) {
                      final ChapterModel? chapter =
                          controller.argsData?.listChapter?[index];
                      final String chapterTitle =
                          (chapter?.chapterTitle != "" &&
                                  chapter?.chapterTitle != null)
                              ? "- ${chapter?.chapterTitle}"
                              : "";
                      final String key =
                          "${chapter?.chapterName}${chapter?.chapterTitle}";
                      final bool active = key ==
                          "${controller.chapterDetailModel.value.item?.chapterName}${controller.chapterDetailModel.value.item?.chapterTitle}";
                      return ColoredBox(
                        color: active
                            ? AppThemeColors.primary
                            : AppColors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (chapter != null) {
                              controller.changeChapter(index);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ListTile(
                              title: TextWidget(
                                textStyle: AppTextStyle.regular16,
                                text:
                                    "Chương ${chapter?.chapterName} $chapterTitle",
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}

class _BodyBuilder extends GetView<ComicReadController> {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.chapterDetailModel.obx(
          onLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          onData: (chapter) {
            final chapterImageList = chapter.item?.chapterImages ?? [];
            final chapterItem = chapter.item;
            if (chapterItem == null || chapterImageList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Obx(
              () {
                final count = controller.visibleCount.value;
                return ListView.builder(
                  controller: controller.scrollController,
                  itemCount: count.clamp(0, chapterImageList.length),
                  itemBuilder: (_, index) {
                    final String urlImage =
                        "${chapter.domainCdn}/${chapterItem.chapterPath}/${chapterImageList[index].imageFile}";
                    return CachedNetworkImage(
                      imageUrl: urlImage,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => Container(
                        color: AppColors.dark500,
                        height: 200,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, size: 50),
                    );
                  },
                );
              },
            );
          },
          onError: (error) => const Center(
            child: Icon(
              Icons.error,
            ),
          ),
        ),

        ///---> [Handel Overlay]

        // 👉 Khu vực bấm để scroll lên
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.scrollUp,
                  onLongPress: controller.toggleControls,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.scrollDown,
                  onLongPress: controller.toggleControls,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ),

        Obx(() {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            top: 40,
            left: controller.showControls.value ? 16 : -40,
            child: const IconCircle(),
          );
        }),

        Obx(() {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            top: 40,
            left: controller.showControls.value ? 60 : -70, // ẩn/hiện
            child: IconCircle(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(Icons.menu, color: Colors.white),
            ),
          );
        }),

        Obx(
          () {
            final chapterItem = controller.chapterDetailModel.value.item;

            return AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutBack,
              bottom: controller.showControls.value ? 20 : -120, // ẩn/hiện
              left: 15.w,
              right: 15.w,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: controller.showControls.value ? 1 : 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.dark300.withValues(alpha: .6),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dark500.withValues(alpha: .4),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Nút Previous
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: controller.prevChapter,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Nội dung chính
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            chapterItem == null
                                ? const ShimmerWidget(width: 100, height: 20)
                                : TextWidget(
                                    text: "Chương ${chapterItem.chapterName}",
                                    textStyle: AppTextStyle.semiBold16,
                                  ),
                            const SizedBox(height: 6),
                            chapterItem == null
                                ? const ShimmerWidget(width: 200, height: 20)
                                : TextWidget(
                                    textAlign: TextAlign.center,
                                    text: chapterItem.comicName.orNA(),
                                    textStyle: AppTextStyle.semiBold16,
                                  ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Nút Next
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: controller.nextChapter,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
