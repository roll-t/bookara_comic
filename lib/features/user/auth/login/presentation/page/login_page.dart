import 'package:auto_find/core/config/const/app_images.dart';
import 'package:auto_find/core/ui/styles/app_padding.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/images/asset_image_widget.dart';
import 'package:auto_find/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/core/utils/custom_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends CustomState {
  const LoginPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            assetPath: AppImages.iLogo,
            width: 25.w,
          ),
          const SizedBox(height: 18),
          const TextWidget(
            text: "Đăng nhập",
            textStyle: AppTextStyle.bold30,
          ),
          const CustomTextField()
        ],
      ),
    );
  }
}
