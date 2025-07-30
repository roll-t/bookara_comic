import 'package:bookara/core/ui/widgets/app_bar/custom_appbar.dart';
import 'package:bookara/core/ui/widgets/standard_layout_widget.dart';
import 'package:flutter/material.dart';

//Page builder
class DashboardPage extends StatelessWidget {
  static String routeName = "/DashboardPage";
  final BuildContext? parentContext;
  const DashboardPage({
    super.key,
    this.parentContext,
  });
  @override
  Widget build(BuildContext context) {
    return const BodyBuilder();
  }
}

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return StandardLayoutWidget(
      appBar: const CustomAppBar(
        title: "Báo cáo ",
      ),
      bodyBuilder: Container(),
    );
  }
}
