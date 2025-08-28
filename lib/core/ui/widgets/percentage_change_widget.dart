import 'package:auto_find/core/config/const/app_icons.dart';
import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/core/utils/utils.dart';
import 'package:flutter/material.dart';

class PercentageChangeWidget extends StatelessWidget {
  final String value;
  final bool isPositive;

  const PercentageChangeWidget({
    super.key,
    required this.value,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Utils.iconSvg(
          svgUrl: isPositive ? AppIcons.icIncrease : AppIcons.icDecrease,
          size: 20,
        ),
        TextWidget(
          text: value,
          textStyle: AppTextStyle.regular10,
          color: isPositive ? AppColors.green : AppColors.red,
        ), 
      ],
    );
  }
}
