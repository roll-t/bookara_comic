import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicPage extends StatelessWidget {
  const ComicPage({super.key});

  @override
  Widget build(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends GetView<ComicController> {
  const _BodyBuilder();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
