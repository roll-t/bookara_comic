import 'package:auto_find/core/config/const/app_vectors.dart';
import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:auto_find/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      enableBorder: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10),
        child: Utils.iconSvg(
          svgUrl: AppVectors.icSearch,
        ),
      ),
      backgroundColor: AppColors.white,
      hintText: "Nhập tên xe tìm kiếm....",
      borderRadius: 10,
      borderWidth: 1,
      controller: TextEditingController(),
    );
  }
}
