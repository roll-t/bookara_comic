import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/features/main/presentation/widgets/item_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onChange;
  final Color selectedItemColor;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onChange,
    required this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: currentIndex,
      onTap: onChange,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: AppColors.border2,
      showUnselectedLabels: true,
      items: [
        buildNavItem(label: 'Báo cáo', iconPath: AppIcons.icChart),
        buildNavItem(label: 'Quản lý', iconPath: AppIcons.icManage),
        buildNavItem(label: 'Cá nhân', iconPath: AppIcons.icSetting),
      ],
    );
  }
}
