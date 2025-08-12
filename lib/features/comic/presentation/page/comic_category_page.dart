import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:flutter/widgets.dart';

class ComicCategoryPage extends CustomStatePage {
  const ComicCategoryPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: TextWidget(text: "Danh muc truyen tranh"),
    );
  }
}
