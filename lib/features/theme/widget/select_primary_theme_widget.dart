import 'package:bookara/core/config/theme/app_color_scheme.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPrimaryThemeWidget extends GetView<ThemeController> {
  const SelectPrimaryThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Primary Theme',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Dropdown for selecting theme
          DropdownButton<int>(
            value: controller.currentThemeIndex.value.index,
            items:
                AppColorTheme.values.map((theme) {
                  return DropdownMenuItem(
                    value: theme.index,
                    child: Text(
                      theme.toString().split('.').last,
                    ),
                  );
                }).toList(),
            onChanged: (selectedIndex) {
              if (selectedIndex != null) {
                final selectedTheme = AppColorTheme.values[selectedIndex];
                controller.changePrimaryTheme(selectedTheme);
              }
            },
            hint: const Text('Select a theme'),
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}
