import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/images/asset_image_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/module/detail/controller/comic_read_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicReadPage extends CustomStatePage {
  const ComicReadPage({super.key});
  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
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
              return Center(
                child: AssetImageWidget(
                  width: 30.w,
                  assetPath: AppImages.iLogoLoading,
                ),
              );
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
          onError: (error) => Center(child: Text("Lỗi: $error")),
        ),

        // 👉 Khu vực bấm để scroll lên
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.scrollUp,
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
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ),

        const Positioned(
          top: 40,
          left: 16,
          child: IconCircle(),
        ),
      ],
    );
  }
}
