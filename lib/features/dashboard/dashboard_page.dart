import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/data/model/item_model.dart';
import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/app_bar/main_appbar.dart';
import 'package:bookara/core/ui/widgets/bottom_sheet/custom_bottom_sheet_widget.dart';
import 'package:bookara/core/ui/widgets/standard_layout_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_span_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/ui/widgets/wrap_body_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  static String routeName = "/DashboardPage";
  final BuildContext? parentContext;

  const DashboardPage({
    super.key,
    this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return StandardLayoutWidget(
      appBar: const MainAppBar(
        title: "Báo cáo ",
        menuItem: [DashboardActionWidget()],
      ),
      bodyBuilder: SingleChildScrollView(
        child: Column(
          children: [
            WrapBodyWidget(
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: TextWidget(
                          text: "Tình hình tài chính",
                          textStyle: AppTextStyle.bold14,
                        ),
                      ),
                      CustomBottomSheetWidget(
                        height: 30,
                        leadingIconUrl: AppIcons.icCash,
                        isMaxParent: false,
                        hint: "Chọn đơn vị tiền",
                        controller: controller.currencyBottomSheetController,
                        onSelectedItem: (ItemModel item) {
                          controller.currencyBottomSheetController.itemSelected
                              .value = item;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomBottomSheetWidget(
                          height: 30,
                          leadingIconUrl: AppIcons.icDate,
                          hint: "Chọn năm",
                          controller: controller.yearBottomSheetController,
                          onSelectedItem: (ItemModel item) {
                            controller.yearBottomSheetController.itemSelected
                                .value = item;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomBottomSheetWidget(
                          height: 30,
                          leadingIconUrl: AppIcons.icDate,
                          hint: "Chọn tháng",
                          controller: controller.monthBottomSheetController,
                          onSelectedItem: (ItemModel item) {
                            controller.monthBottomSheetController.itemSelected
                                .value = item;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            WrapBodyWidget(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                      child: TextSpanWidget(
                        fontWeight2: FontWeight.bold,
                        textColor2: AppThemeColors.secondary,
                        text1: "Nợ đáo hạn: ",
                        text2: "20/02/2026",
                      ),
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          text: "Chi tiết",
                          textStyle: AppTextStyle.regular10,
                        ),
                        Utils.iconSvg(svgUrl: AppIcons.icArrowRight, size: 18),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomBottomSheetWidget(
                  isMaxParent: false,
                  label: "Biểu đồ thống kê",
                  titleBottomSheet: "Chọn thống kê",
                  hint: "Chọn thống kê",
                  onSelectedItem: (value) {},
                  controller: controller.filterChartSheetController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardActionWidget extends StatelessWidget {
  const DashboardActionWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.dialog(
          Center(
            child: Container(
              width: Get.width * .95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: AppColors.primary1_500,
                    ),
                    child: Row(
                      children: [
                        Utils.iconSvg(
                          svgUrl: AppIcons.icChart,
                          size: 20,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: TextWidget(
                            text: "Báo cáo khác",
                            textAlign: TextAlign.start,
                            textStyle: AppTextStyle.regular16,
                            color: AppColors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
          barrierDismissible: true,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary2_200,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: AppColors.white,
          ),
        ),
        child: Row(
          children: [
            Utils.iconSvg(
              svgUrl: AppIcons.icChart,
              color: AppColors.primary1_500,
            ),
            const SizedBox(width: 5),
            const TextWidget(
              text: "Báo cáo khác",
              textStyle: AppTextStyle.regular12,
              color: AppColors.primary1_500,
            )
          ],
        ),
      ),
    );
  }
}
