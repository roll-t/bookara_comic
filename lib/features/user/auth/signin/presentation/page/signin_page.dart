import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/core/utils/custom_framework.dart';
import 'package:flutter/cupertino.dart';

class SigninPage extends CustomState {
  const SigninPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextWidget(text: "Đăng ký"),
        Container(),
      ],
    );
  }
}
