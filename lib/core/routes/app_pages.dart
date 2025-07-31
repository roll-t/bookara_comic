import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/auth/presentation/page/login/login_page.dart';
import 'package:bookara/features/auth/presentation/page/register/register_page.dart';
import 'package:bookara/features/comic/dashboard_binding.dart';
import 'package:bookara/features/comic/dashboard_page.dart';
import 'package:bookara/features/navigation/di/navigation_binding.dart';
import 'package:bookara/features/navigation/presentation/page/navigation_page.dart';
import 'package:bookara/features/notFound/page/not_found_page.dart';
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
    name: const NavigationPage().routeName,
    page: () => const NavigationPage(),
    binding: NavigationBinding(),
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
    page: () => const LoginPage(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const RegisterPage(),
  ),
];
