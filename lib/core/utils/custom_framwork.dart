import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';

/// ✅ Base class cho các màn hình Stateless sử dụng GetX
/// Giúp tái sử dụng scaffold + appBar + cấu hình route dễ dàng
abstract class PageStatelessWidget extends StatelessWidget {
  const PageStatelessWidget({super.key});

  /// ✅ Tên route mặc định dạng kebab-case, ví dụ: /user-detail
  String get routeName => '/${ReCase(runtimeType.toString()).paramCase}';

  /// ✅ Tiêu đề cho AppBar mặc định (nếu không custom appBar)
  String get title => '';

  /// ✅ Có hiển thị nút back không? (dùng cho AppBar mặc định)
  bool get showBack => false;

  /// ✅ Custom AppBar nếu muốn, nếu null thì dùng mặc định
  PreferredSizeWidget? get appBar => null;

  /// ✅ Màu nền của Scaffold
  Color? get backgroundColor => null;

  /// ✅ FAB nếu có
  Widget? get floatingActionButton => null;

  /// ✅ BottomNavigationBar nếu có
  Widget? get bottomNavigationBar => null;

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
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: showBack,
    );
  }

  /// ✅ Dùng để khai báo route dễ dàng khi sử dụng GetX
  ///
  /// Ví dụ:
  /// ```dart
  /// GetPage(name: HomePage().routeName, page: () => HomePage())
  /// ```
  static GetPage toRoute<T extends PageStatelessWidget>(T page) {
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

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar ?? buildDefaultAppBar(context),
      body: size.width > 800 ? buildTabletBody(context) : buildBody(context),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
