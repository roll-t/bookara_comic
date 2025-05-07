import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/auth/page/signin_page.dart';
import 'package:bookara/features/auth/page/signup_page.dart';
import 'package:bookara/features/category/presentation/page/category_page.dart';
import 'package:bookara/features/home/di/home_binding.dart';
import 'package:bookara/features/home/presentation/page/home_page.dart';
import 'package:bookara/features/main/di/main_binding.dart';
import 'package:bookara/features/main/presentation/page/main_page.dart';
import 'package:bookara/features/notFound/page/not_found_page.dart';
import 'package:bookara/features/setting/di/setting_binding.dart';
import 'package:bookara/features/setting/page/setting_page.dart';
import 'package:bookara/features/splash/di/splash_binding.dart';
import 'package:bookara/features/splash/page/splash_page.dart';
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
  ),
  GetPage(name: NotFoundPage.routeName, page: () => const NotFoundPage()),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),

  GetPage(name: AppRoutes.signin, page: () => const SigninPage()),
  GetPage(name: AppRoutes.signup, page: () => const SignupPage()),
  GetPage(
    name: SettingPage.routeName,
    page: () => const SettingPage(),
    binding: SettingBinding(),
  ),
  GetPage(name: CategoryPage.routeName, page: () => const CategoryPage()),
];
