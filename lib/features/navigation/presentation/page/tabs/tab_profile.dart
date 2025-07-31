import 'package:bookara/core/utils/custom_framework.dart';
import 'package:bookara/features/setting/presentation/page/setting_page.dart';
import 'package:flutter/material.dart';

// NAV Home
class TabProfile extends PageStatelessWidget {
  const TabProfile({super.key});

  @override
  String get title => "Cá nhân";

  @override
  Widget buildBody(BuildContext context) {
    return const SettingPage();
  }
}
