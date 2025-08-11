import 'package:bookara/core/config/theme/app_colors.dart';
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
          title: appBar,
          floating: true,
          snap: true,
          pinned: false,
          elevation: 0,
          backgroundColor: AppColors.transparent,
          surfaceTintColor: AppColors.transparent,
          flexibleSpace: Container(
            color: AppColors.transparent,
          ),
        ),
        SliverToBoxAdapter(
          child: bodyBuilder,
        )
      ],
    );
  }
}
