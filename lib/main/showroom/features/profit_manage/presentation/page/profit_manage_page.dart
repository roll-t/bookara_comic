import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/custom_bottom_sheet_widget.dart';
import 'package:auto_find/core/ui/widgets/tab_bar/custom_tab_bar_widget.dart';
import 'package:auto_find/core/ui/widgets/texts/text_span_widget.dart';
import 'package:auto_find/core/utils/custom_framework.dart';
import 'package:auto_find/main/showroom/features/profit_manage/presentation/controller/profit_manage_controller.dart';
import 'package:auto_find/main/showroom/features/profit_manage/presentation/widgets/tabs_section/car_profit_section.dart';
import 'package:auto_find/main/showroom/features/profit_manage/presentation/widgets/tabs_section/year_profit_car_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitManagePage extends CustomState {
  const ProfitManagePage({super.key});

  @override
  bool get backgroundImage => true;

  @override
  bool get dismissKeyboard => true;

  @override
  String? get title => "Quản lý lợi nhuận";
  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends StatelessWidget {
  const _BodyBuilder();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const _ProfitAvenueWidget(),
        const SizedBox(height: 20),

        ///---> [Tab barx]
        GetBuilder<ProfitManageController>(
          builder: (controller) {
            return CustomTabBarWidget(
              label: "Tiêu chí thống kê",
              controller: controller.tabBarController,
              tabBodies: const [
                YearProfitCarSection(),
                CarProfitSection(),
              ],
            );
          },
        )
      ],
    );
  }
}

class _ProfitAvenueWidget extends StatelessWidget {
  const _ProfitAvenueWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: AppColors.white,
        ),
        child: GetBuilder<ProfitManageController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomBottomSheetWidget(
                        hint: "Chọn năm",
                        controller: controller.yearBottomSheetController,
                        onSelectedItem: (ItemModel item) {
                          controller.yearSelected = item;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomBottomSheetWidget(
                        hint: "Chọn tháng",
                        controller: controller.monthBottomSheetController,
                        onSelectedItem: (ItemModel item) {
                          controller.yearSelected = item;
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      TextSpanWidget(
                        fontWeight2: FontWeight.bold,
                        textColor2: AppColors.accent,
                        text1: "Tổng giá trị: ",
                        text2: "161,333,500,000 VNĐ",
                      ),
                      SizedBox(height: 16),
                      TextSpanWidget(
                        fontWeight2: FontWeight.bold,
                        textColor2: AppColors.accent,
                        text1: "Tổng lợi nhuận: ",
                        text2: "8,823,900,000 VNĐ",
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
