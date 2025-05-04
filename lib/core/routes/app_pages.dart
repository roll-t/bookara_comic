import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/auth/page/signin_page.dart';
import 'package:bookara/features/auth/page/signup_page.dart';
import 'package:bookara/features/home/di/home_binding.dart';
import 'package:bookara/features/home/page/home_page.dart';
import 'package:bookara/features/setting/di/setting_binding.dart';
import 'package:bookara/features/setting/page/setting_page.dart';
import 'package:bookara/features/splash/di/splash_binding.dart';
import 'package:bookara/features/splash/page/splash_page.dart';
import 'package:get/get.dart';

final appPage = [
  GetPage(
    name: AppRoutes.initial,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
  GetPage(name: AppRoutes.signin, page: () => SigninPage()),
  GetPage(name: AppRoutes.signup, page: () => SignupPage()),
  GetPage(
    name: AppRoutes.setting,
    page: () => SettingPage(),
    binding: SettingBinding(),
  ),
];
