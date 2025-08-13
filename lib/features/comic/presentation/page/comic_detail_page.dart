import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/controller/comic_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicDetailPage extends CustomStatePage {
  const ComicDetailPage({super.key});

  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends GetView<ComicDetailController> {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return controller.comicDetail.obx(
      onData: (value) {
        return Center(
          child: Text(value.name ?? 'Loading...'),
        );
      },
    );
  }
}
