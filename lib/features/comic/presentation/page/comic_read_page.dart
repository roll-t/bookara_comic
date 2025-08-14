import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/widgets/custom_sliver_layout.dart';
import 'package:bookara/core/ui/widgets/images/cache_image_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/controller/comic_read_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              return const Center(child: Text("Không có dữ liệu chương"));
            }

            return ListView.builder(
              itemCount: chapterImageList.length,
              itemBuilder: (_, index) {
                final String urlImage = "${chapter.domainCdn}/${chapterItem.chapterPath}/${chapterImageList[index].imageFile}";
                return CacheImageWidget(
                  imageUrl: urlImage,
                );
              },
            );
          },
          onError: (error) => Center(child: Text("Lỗi: $error")),
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
