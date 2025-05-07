import 'package:bookara/core/config/const/app_dimens.dart';
import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:bookara/core/config/theme/app_theme_colors.dart';
import 'package:bookara/core/ui/widgets/text_widget.dart';
import 'package:bookara/core/utils/helper.dart';
import 'package:bookara/features/category/presentation/page/category_page.dart';
import 'package:bookara/features/home/presentation/page/home_page.dart';
import 'package:bookara/features/setting/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// define model navition bar
class NavItemModel {
  int index;
  String? name;
  String? svgUrl;
  String? routeUrl;

  NavItemModel({required this.index, this.name, this.svgUrl, this.routeUrl});
}

// class navigation widget
class NavigationBarWidget extends StatelessWidget {
  final int currentPage;
  final Function(int index) onChange;
  const NavigationBarWidget({
    super.key,
    required this.currentPage,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    // define list child navigation bar
    final List<NavItemModel> listNavitem = [
      NavItemModel(
        index: 0,
        name: "Category",
        svgUrl: AppIcons.icCategory,
        routeUrl: CategoryPage.routeName,
      ),
      NavItemModel(
        index: 1,
        name: "Home",
        svgUrl: AppIcons.icHome,
        routeUrl: HomePage.routeName,
      ),
      NavItemModel(
        index: 2,
        name: "Setting",
        svgUrl: AppIcons.icSetting,
        routeUrl: SettingPage.routeName,
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(color: AppThemeColors.primary),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(listNavitem.length, (index) {
          final navChild = listNavitem[index];
          bool isCurrentIndex = currentPage == index;
          return Container(
            alignment: Alignment.center,
            width: 20.w,
            height: 11.w,
            decoration:
                isCurrentIndex
                    ? BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50),
                    )
                    : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              alignment: Alignment.center,
              width: 20.w,
              height: 11.w,
              decoration: BoxDecoration(
                color: isCurrentIndex ? AppColors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  if (navChild.routeUrl == null) return;
                  onChange(index);
                },
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: isCurrentIndex ? 1.1 : 1.0,
                  curve: Curves.easeOutBack,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Helper.iconSvg(svgUrl: navChild.svgUrl, size: 20),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                        ) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.5),
                              end: Offset.zero,
                            ).animate(animation),
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child:
                            isCurrentIndex
                                ? Column(
                                  key: ValueKey(navChild.index),
                                  children: [
                                    const SizedBox(height: 4),
                                    TextWidget(
                                      text: navChild.name ?? "",
                                      size: AppDimens.fontSizeSmall,
                                    ),
                                  ],
                                )
                                : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
