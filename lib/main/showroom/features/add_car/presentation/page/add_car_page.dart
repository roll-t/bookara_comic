
import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/config/theme/app_colors.dart';
import 'package:auto_find/core/config/theme/app_theme_colors.dart';
import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/custom_bottom_sheet_widget.dart';
import 'package:auto_find/core/ui/widgets/buttons/primary_button.dart';
import 'package:auto_find/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:auto_find/core/ui/widgets/standard_layout_widget.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/main/showroom/features/add_car/presentation/controller/add_car_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarPage extends GetView<AddCarController> {
  static const String routeName = "/add_car_page";
  const AddCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardLayoutWidget(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
      titleAppBar: "Thêm xe mới",
      bodyBuilder: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppThemeColors.primary.withValues(alpha: 0.1),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: TextWidget(
                      textAlign: TextAlign.start,
                      text: "Thông tin cơ bản",
                      color: AppThemeColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Tên xe",
                      hintText: "Nhập tên xe",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Biển số",
                      hintText: "Nhập biển số xe",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      type: CustomTextFieldType.datePicker,
                      label: "Năm sản xuất",
                      hintText: "Chọn năm sản xuất",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomBottomSheetWidget(
                      height: 45,
                      label: "Hãng xe",
                      hint: "Chọn hãng xe",
                      onSelectedItem: (ItemModel) {},
                      controller: BottomSheetController(
                        listItem: <ItemModel>[].obs,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomBottomSheetWidget(
                      height: 45,
                      label: "Loại xe",
                      hint: "Chọn loại xe",
                      onSelectedItem: (ItemModel) {},
                      controller: BottomSheetController(
                        listItem: <ItemModel>[].obs,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Biển số",
                      hintText: "Nhập biển số xe",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      type: CustomTextFieldType.datePicker,
                      label: "Năm sản xuất",
                      hintText: "Chọn năm sản xuất",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomBottomSheetWidget(
                      height: 45,
                      label: "Trạng thái xe",
                      hint: "Chọn trạng thái xe",
                      onSelectedItem: (ItemModel) {},
                      controller: BottomSheetController(
                        listItem: <ItemModel>[].obs,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: const CustomTextField(
                      type: CustomTextFieldType.datePicker,
                      label: "Năm sản xuất",
                      hintText: "Chọn năm sản xuất",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomBottomSheetWidget(
                      height: 45,
                      label: "Giá mua  ",
                      hint: "Chọn trạng thái xe",
                      onSelectedItem: (ItemModel) {},
                      controller: BottomSheetController(
                        listItem: <ItemModel>[].obs,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: const CustomTextField(
                      type: CustomTextFieldType.datePicker,
                      label: "Năm sản xuất",
                      hintText: "Chọn năm sản xuất",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                isMaxParent: true,
                text: "Thêm xe",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
