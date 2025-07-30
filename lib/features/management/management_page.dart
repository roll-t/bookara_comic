import 'package:bookara/core/ui/styles/app_text_styles.dart';
import 'package:bookara/core/ui/widgets/app_bar/main_appbar.dart';
import 'package:bookara/core/ui/widgets/item_menu_feature_widget.dart';
import 'package:bookara/core/ui/widgets/standard_layout_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/ui/widgets/wrap_body_widget.dart';
import 'package:bookara/features/main/model/item_menu_feature_model.dart';
import 'package:bookara/features/management/management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagementPage extends GetView<ManagementController> {
  static String routeName = "/ManagementPage";
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardLayoutWidget(
      appBar: const MainAppBar(title: "Quản Lý"),
      bodyBuilder: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildFeatureSection(
              title: "Tín dụng",
              items: controller.listCreditFeature,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureSection({
    required String title,
    required List<ItemMenuFeatureModel> items,
  }) {
    return WrapBodyWidget(
      header: TextWidget(
        text: title,
        textStyle: AppTextStyle.bold16,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemBuilder: (_, index) {
          final item = items[index];
          return ItemMenuFeatureWidget(
            title: item.title,
            iconUrl: item.iconUrl,
            routeNameUrl: item.routeNameUrl,
          );
        },
      ),
    );
  }
}
