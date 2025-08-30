import 'package:auto_find/main/navigation/di/navigation_binding.dart';
import 'package:auto_find/main/navigation/presentation/page/navigation_page.dart';
import 'package:auto_find/core/ui/widgets/notFound/not_found_page.dart';
import 'package:auto_find/main/splash/di/splash_binding.dart';
import 'package:auto_find/main/splash/presentation/page/splash_page.dart';
import 'package:auto_find/main/user/features/auth/login/di/login_binding.dart';
import 'package:auto_find/main/user/features/auth/login/presentation/page/login_page.dart';
import 'package:auto_find/main/user/features/auth/signin/di/signin_binding.dart';
import 'package:auto_find/main/user/features/auth/signin/presentation/page/signin_page.dart';
import 'package:get/get.dart';

final notFoundPage = GetPage(
  name: NotFoundPage.routeName,
  page: () => const NotFoundPage(),
);

final appPage = [
  GetPage(
    name: "/splash",
    page: () => const SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: const NavigationPage().routeName,
    page: () => const NavigationPage(),
    binding: NavigationBinding(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: const LoginPage().routeName,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: const SigninPage().routeName,
    page: () => const SigninPage(),
    binding: SigninBinding(),
  ),
  GetPage(
    name: NotFoundPage.routeName,
    page: () => const NotFoundPage(),
  ),
];
