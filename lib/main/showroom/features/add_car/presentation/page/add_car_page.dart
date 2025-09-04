import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/config/theme/app_theme_colors.dart';
import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/ui/styles/app_container_styles.dart';
import 'package:auto_find/core/ui/styles/app_padding.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/custom_bottom_sheet_widget.dart';
import 'package:auto_find/core/ui/widgets/buttons/primary_button.dart';
import 'package:auto_find/core/ui/widgets/inputs/custom_text_field.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/core/utils/custom_framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarPage extends CustomState {
  const AddCarPage({super.key});

  @override
  String? get title => "Thêm xe mới";

  @override
  bool get backgroundImage => true;

  @override
  bool get dismissKeyboard => true;

  @override
  Widget buildBody(BuildContext context) => const _BodyBuilder();
}

class _BodyBuilder extends StatelessWidget {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.all16,
      padding: AppPadding.v16,
      decoration: AppContainerStyles.card200(),
      child: SingleChildScrollView(
        padding: AppPadding.h16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader("Thông tin cơ bản"),
            const SizedBox(height: 12),
            buildTwoFields(
              buildTextField(label: "Tên xe", hint: "Nhập tên xe"),
              buildTextField(label: "Biển số", hint: "Nhập biển số xe"),
            ),
            const SizedBox(height: 20),
            buildTwoFields(
              buildBottomSheetField(label: "Hãng xe", hint: "Chọn hãng xe"),
              buildBottomSheetField(label: "Loại xe", hint: "Chọn loại xe"),
            ),
            const SizedBox(height: 20),
            buildTwoFields(
              buildBottomSheetField(
                  label: "Trạng thái xe", hint: "Chọn trạng thái xe"),
              buildTextField(
                label: "Năm sản xuất",
                hint: "Chọn năm sản xuất",
                type: CustomTextFieldType.datePicker,
              ),
            ),
            const SizedBox(height: 20),
            buildTwoFields(
              buildBottomSheetField(label: "Giá mua", hint: "Nhập giá mua"),
              buildTextField(
                label: "Năm sản xuất",
                hint: "Chọn năm sản xuất",
                type: CustomTextFieldType.datePicker,
              ),
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
    );
  }
}

//
// 🔹 Widget helpers
//

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppThemeColors.primary.withValues(alpha: 0.1),
          ),
          padding: AppPadding.v6h12,
          child: TextWidget(
            textAlign: TextAlign.start,
            text: text,
            color: AppThemeColors.primary,
            textStyle: AppTextStyle.semiBold14,
          ),
        ),
      ],
    );
  }
}

/// Row có 2 field (giảm lặp lại Expanded + SizedBox)
Widget buildTwoFields(
  Widget left,
  Widget right,
) {
  return Padding(
    padding: AppPadding.v4,
    child: Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right),
      ],
    ),
  );
}

/// Tạo TextField ngắn gọn
Widget buildTextField({
  required String label,
  required String hint,
  CustomTextFieldType type = CustomTextFieldType.text,
}) {
  return CustomTextField(
    label: label,
    hintText: hint,
    type: type,
  );
}

/// Tạo BottomSheet field ngắn gọn
Widget buildBottomSheetField({
  required String label,
  required String hint,
}) {
  // Controller tạo 1 lần duy nhất cho mỗi widget (tránh re-render)
  final controller = BottomSheetController(listItem: <ItemModel>[].obs);
  return CustomBottomSheetWidget(
    height: 45,
    label: label,
    hint: hint,
    controller: controller,
    onSelectedItem: (_) {},
  );
}
