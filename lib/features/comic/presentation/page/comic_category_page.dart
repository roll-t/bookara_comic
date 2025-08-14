import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/card/comic_row_card.dart';
import 'package:bookara/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/controller/comic_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicCategoryPage extends CustomStatePage {
  const ComicCategoryPage({super.key});

  @override
  Widget? get appBar => const _BuildAppBar();

  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BuildAppBar extends GetView<ComicCategoryController> {
  const _BuildAppBar();

  @override
  Widget build(BuildContext context) {
    return controller.titlePage.obx(
      onData: (title) => TextWidget(
        text: title,
        textStyle: AppTextStyle.bold18,
        maxLines: 1,
      ),
    );
  }
}

class _BodyBuilder extends GetView<ComicCategoryController> {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.builder(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: controller.listComicByCategory.length +
              (controller.isLoadingMore.value ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= controller.listComicByCategory.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0)
                    .copyWith(top: 8),
                child: const Column(
                  children: [
                    ShimmerWidget(height: 120),
                    SizedBox(height: 16),
                    ShimmerWidget(height: 120),
                  ],
                ),
              );
            }

            final comic = controller.listComicByCategory[index];
            return ComicRowCard(comic: comic);
          },
        );
      },
    );
  }
}
