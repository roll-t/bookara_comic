import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/custom_framework.dart';
import 'package:flutter/cupertino.dart';

class ComicExplorePage extends CustomStatePage {
  const ComicExplorePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: TextWidget(text: "Tim kiem"),
    );
  }
}
