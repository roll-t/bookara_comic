import 'package:auto_find/core/config/theme/app_theme_colors.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/app_bar/custom_appbar.dart';
import 'package:auto_find/core/ui/widgets/custom_sliver_layout.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:auto_find/core/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';

/// ✅ Base class cho các màn hình Stateless sử dụng GetX
/// Giúp tái sử dụng scaffold + appBar + cấu hình route dễ dàng
abstract class CustomState extends StatelessWidget {
  const CustomState({super.key});

  /// ✅ Tên route mặc định dạng kebab-case, ví dụ: /user-detail
  String get routeName => '/${ReCase(runtimeType.toString()).paramCase}';

  /// ✅ Tiêu đề cho AppBar mặc định (nếu không custom appBar)
  String? get title => null;

  /// ✅ Có hiển thị nút back không? (dùng cho AppBar mặc định)
  bool get showBack => true;

  bool get dismissKeyboard => false;

  /// ✅ Custom AppBar nếu muốn, nếu null thì dùng mặc định
  Widget? get appBar => null;

  Widget? get drawer => null;

  /// ✅ Màu nền của Scaffold
  Color? get backgroundColor => AppThemeColors.background300;

  /// ✅ FAB nếu có
  Widget? get floatingActionButton => null;

  /// ✅ BottomNavigationBar nếu có
  Widget? get bottomNavigationBar => null;

  bool get isShowBack => true;

  /// ✅ Hiệu ứng chuyển trang khi dùng Get.to()
  Transition get transition => Transition.fadeIn;

  /// ✅ Binding controller nếu cần, dùng khi khai báo route
  Bindings? get binding => null;

  /// ✅ UI chính của trang (dùng cho mobile)
  Widget buildBody(BuildContext context);

  /// ✅ UI riêng cho tablet (mặc định fallback buildBody)
  Widget buildTabletBody(BuildContext context) => buildBody(context);

  /// ✅ AppBar mặc định nếu không custom
  PreferredSizeWidget buildDefaultAppBar(BuildContext context) {
    return CustomAppBar(
      showBackButton: showBack,
      title: title,
    );
  }

  /// ✅ Dùng để khai báo route dễ dàng khi sử dụng GetX
  ///
  /// Ví dụ:
  /// ```dart
  /// GetPage(name: HomePage().routeName, page: () => HomePage())
  /// ```
  static GetPage toRoute<T extends CustomState>(T page) {
    return GetPage(
      name: page.routeName,
      page: () => page,
      binding: page.binding,
      transition: page.transition,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: dismissKeyboard
          ? () {
              KeyboardUtils.hiddenKeyboard();
            }
          : null,
      child: Scaffold(
        drawer: drawer,
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        appBar: (title == null && appBar != null)
            ? AppBar(
                centerTitle: true,
                backgroundColor: AppThemeColors.background200,
                leading: isShowBack && Navigator.of(context).canPop()
                    ? const Center(child: IconCircle())
                    : null,
                title: appBar,
                elevation: 0,
              )
            : (title != null && appBar == null)
                ? AppBar(
                    centerTitle: true,
                    backgroundColor: AppThemeColors.background200,
                    leading: isShowBack && Navigator.of(context).canPop()
                        ? const Center(child: IconCircle())
                        : null,
                    title: TextWidget(
                      text: title ?? "",
                      textStyle: AppTextStyle.bold18,
                    ),
                    elevation: 0,
                  )
                : null,
        body: size.width > 800 ? buildTabletBody(context) : buildBody(context),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
