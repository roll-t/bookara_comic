import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/comic/presentation/page/comic_page.dart';
import 'package:flutter/material.dart';

// NAV Home
class TabComicCollection extends CustomStatePage {
  const TabComicCollection({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const ComicPage();
  }
}
