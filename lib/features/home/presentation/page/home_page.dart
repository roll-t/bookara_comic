import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/const/app_images.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/images/asset_image_widget.dart';
import 'package:bookara/core/ui/widgets/texts/text_widget.dart';
import 'package:bookara/core/utils/utils.dart';
import 'package:bookara/features/home/widgets/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookara/features/home/presentation/controller/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 30),
            _buildCategoryBar(),
            const Expanded(child: Center(child: SpinnerWidget())),
          ],
        ),
      ),
    );
  }

  Column _buildCategoryBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Utils.iconSvg(
                    svgUrl: AppIcons.icCategory,
                    size: 20,
                    color: AppThemeColors.primary,
                  ),
                  const SizedBox(width: 10),
                  const TextWidget(
                    text: "Danh mục",
                    fontWeight: FontWeight.bold,
                    size: 16,
                  ),
                ],
              ),
              InkWell(
                child: Row(
                  children: [
                    TextWidget(
                      text: "Tất cả",
                      color: AppThemeColors.primary,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppThemeColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppThemeColors.primary.withValues(alpha: 0.15),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppThemeColors.primary.withValues(alpha: 0.1),
                ),
                margin: EdgeInsets.only(left: index == 0 ? 20 : 15),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AssetImageWidget(
                        assetPath: AppImages.iLogo,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(child: TextWidget(text: "Danh mục", size: 14.sp)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Center _buildAppBar() {
    return const Center(
      child: Column(
        children: [AssetImageWidget(assetPath: AppImages.iLogo, width: 40)],
      ),
    );
  }
}
