import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/data/model/item_model.dart';
import 'package:bookara/core/extension/empty_extension.dart';
import 'package:bookara/core/extension/rx_extension.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final BottomSheetController controller;
  final String? titleBottomSheet;
  final Color? backgroundColor;
  final List<BoxShadow>? shadow;
  final double borderRadius;
  final double height;
  final EdgeInsets padding;
  final String hint;
  final String? label;
  final Function(ItemModel) onSelectedItem;
  final bool isMaxParent;
  final String? leadingIconUrl;
  const CustomBottomSheetWidget({
    super.key,
    required this.onSelectedItem,
    required this.controller,
    this.backgroundColor,
    this.shadow,
    this.leadingIconUrl,
    this.isMaxParent = true,
    this.borderRadius = 6,
    this.height = 35,
    this.padding = const EdgeInsets.only(left: 6, right: 5),
    this.hint = "",
    this.label,
    this.titleBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          TextWidget(
            text: label.orNA(),
            textStyle: AppTextStyle.bold14,
            color: AppColors.text700,
          ),
          const SizedBox(height: 6.0)
        ],
        GestureDetector(
          onTap: () {
            controller.show(
              title: titleBottomSheet.orNA(),
              onSelected: onSelectedItem,
            );
          },
          child: Container(
            padding: padding,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
              border: Border.all(
                width: .5,
                color: const Color.fromRGBO(189, 189, 189, 1),
              ),
            ),
            child: controller.itemSelected.obx(
              onData: (value) {
                return Row(
                  children: [
                    if (leadingIconUrl.isNotNullOrEmpty)
                      Utils.iconSvg(
                        svgUrl: leadingIconUrl.orIcNull(),
                        color: AppColors.text300,
                        size: 18,
                      ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextWidget(
                        text: value.title.orEmpty().isNotEmpty
                            ? value.title.orNA()
                            : hint,
                        size: value.title.orEmpty().isNotEmpty ? 14 : 12,
                        color: value.title.orEmpty().isNotEmpty
                            ? AppColors.text700
                            : AppColors.palette1,
                        fontWeight: value.title.orEmpty().isNotEmpty
                            ? FontWeight.w500
                            : FontWeight.w400,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Utils.iconSvg(
                      svgUrl: AppIcons.icArrowDown,
                      size: 18,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );

    return isMaxParent
        ? SizedBox(width: double.infinity, child: content)
        : Align(
            alignment: Alignment.centerLeft,
            child: IntrinsicWidth(child: content));
  }
}
