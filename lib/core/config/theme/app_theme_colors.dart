import 'package:bookara/core/config/theme/app_color_scheme.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppThemeColors {
  static final ThemeController _themeController = Get.find<ThemeController>();

  static bool get isDark => _themeController.themeMode.value == ThemeMode.dark;

  static AppColorScheme get primaryTheme =>
      _themeController.appColorScheme.value;

  static Color get background300 => primaryTheme.background300;
  static Color get background200 => primaryTheme.background200;
  static Color get background100 => primaryTheme.background100;

  static Color get surface => primaryTheme.surface;

  static Color get card => primaryTheme.card;

  static Color get appBar => primaryTheme.appBar;

  static Color get text => primaryTheme.textDark;

  static Color get textSecondary => primaryTheme.textSecondary;

  static Color get textDisabled => primaryTheme.textDisabled;

  static Color get primary => primaryTheme.primary;

  static Color get secondary => primaryTheme.secondary;

  static Color get error => primaryTheme.error;

  static Color get icon => primaryTheme.icon;

  static Color get iconActive => primaryTheme.iconActive;
  static Color get iconInActive => primaryTheme.iconInactive;

  static Color get iconInactive => primaryTheme.iconInactive;

  static Color get divider => primaryTheme.divider;

  static Color get border => primaryTheme.border;

  static Color get light300 => primaryTheme.light300;
  static Color get light200 => primaryTheme.light200;
  static Color get light100 => primaryTheme.light100;

  static Color get dark700 => primaryTheme.dark700;
  static Color get dark500 => primaryTheme.dark500;
  static Color get dark300 => primaryTheme.dark300;

  static Color get textDark => primaryTheme.textDark;

  static Color get textLight => primaryTheme.textLight;

  static Color get disabledText => AppColors.disabledText;
}
