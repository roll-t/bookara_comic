import 'package:auto_find/features/navigation/di/navigation_binding.dart';
import 'package:auto_find/features/navigation/presentation/page/navigation_page.dart';
import 'package:auto_find/core/ui/widgets/notFound/not_found_page.dart';
import 'package:auto_find/features/splash/di/splash_binding.dart';
import 'package:auto_find/features/splash/presentation/page/splash_page.dart';
import 'package:auto_find/features/user/auth/login/di/login_binding.dart';
import 'package:auto_find/features/user/auth/login/presentation/page/login_page.dart';
import 'package:auto_find/features/user/auth/signin/di/signin_binding.dart';
import 'package:auto_find/features/user/auth/signin/presentation/page/signin_page.dart';
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
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 800),
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
