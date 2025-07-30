import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/auth/presentation/page/signin_page.dart';
import 'package:bookara/features/auth/presentation/page/signup_page.dart';
import 'package:bookara/features/comic/dashboard_binding.dart';
import 'package:bookara/features/comic/dashboard_page.dart';
import 'package:bookara/features/main/di/main_binding.dart';
import 'package:bookara/features/main/presentation/page/main_page.dart';
import 'package:bookara/features/notFound/page/not_found_page.dart';
import 'package:bookara/features/setting/di/setting_binding.dart';
import 'package:bookara/features/setting/presentation/page/setting_page.dart';
import 'package:bookara/features/splash/di/splash_binding.dart';
import 'package:bookara/features/splash/presentation/page/splash_page.dart';
import 'package:get/get.dart';

final appPage = [
  GetPage(
    name: AppRoutes.initial,
    page: () => const SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: MainPage.routeName,
    page: () => const MainPage(),
    binding: MainBinding(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 800),
  ),
  GetPage(
    name: NotFoundPage.routeName,
    page: () => const NotFoundPage(),
  ),
  GetPage(
    name: AppRoutes.dashboard,
    page: () => const DashboardPage(),
    binding: DashboardBinding(),
  ),
  GetPage(
    name: AppRoutes.signin,
    page: () => const SigninPage(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const SignupPage(),
  ),
  GetPage(
    name: SettingPage.routeName,
    page: () => const SettingPage(),
    binding: SettingBinding(),
  ),
];
