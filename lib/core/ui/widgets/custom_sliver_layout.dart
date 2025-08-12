import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

class CustomSliverLayout extends StatelessWidget {
  final Widget? appBar;
  final Widget bodyBuilder;
  const CustomSliverLayout({
    super.key,
    this.appBar,
    required this.bodyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
          title: appBar,
          floating: true,
          snap: true,
          elevation: 0,
          backgroundColor: AppColors.transparent,
          surfaceTintColor: AppColors.transparent,
          flexibleSpace: Container(
            color: AppThemeColors.background300,
          ),
        ),
        SliverToBoxAdapter(
          child: bodyBuilder,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        )
      ],
    );
  }
}
