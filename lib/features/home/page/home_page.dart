import 'package:bookara/features/home/page/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
