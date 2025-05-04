import 'package:bookara/core/config/theme/app_color_scheme.dart';
import 'package:bookara/core/config/theme/app_theme.dart';
import 'package:bookara/core/lang/translation_service.dart';
import 'package:bookara/core/routes/app_pages.dart';
import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/splash/page/splash_page.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        Rx<AppColorScheme> colorScheme = themeController.appColorScheme;
        return Obx(() {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: LocalizationService(),
            locale: LocalizationService.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            getPages: appPage,
            initialRoute: AppRoutes.initial,
            home: SplashPage(),
            theme: AppTheme.light(colorScheme.value),
            darkTheme: AppTheme.dark(colorScheme.value),
            themeMode: themeController.themeMode.value,
          );
        });
      },
    );
  }
}
