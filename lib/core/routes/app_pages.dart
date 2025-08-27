import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/features/auth/presentation/page/login/login_page.dart';
import 'package:bookara/features/auth/presentation/page/register/register_page.dart';
import 'package:bookara/features/comic/di/comic_category_binding.dart';
import 'package:bookara/features/comic/di/comic_detail_binding.dart';
import 'package:bookara/features/comic/di/comic_explore_binding.dart';
import 'package:bookara/features/comic/di/comic_read_binding.dart';
import 'package:bookara/features/comic/presentation/module/detail/page/comic_detail_page.dart';
import 'package:bookara/features/comic/presentation/module/detail/page/comic_read_page.dart';
import 'package:bookara/features/comic/presentation/module/explore/page/comic_explore_page.dart';
import 'package:bookara/features/comic/presentation/module/category/page/comic_category_page.dart';
import 'package:bookara/features/navigation/di/navigation_binding.dart';
import 'package:bookara/features/navigation/presentation/page/navigation_page.dart';
import 'package:bookara/core/ui/widgets/notFound/not_found_page.dart';
import 'package:bookara/features/splash/di/splash_binding.dart';
import 'package:bookara/features/splash/presentation/page/splash_page.dart';
import 'package:get/get.dart';

final notFoundPage = GetPage(
  name: NotFoundPage.routeName,
  page: () => const NotFoundPage(),
);

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
    name: AppRoutes.signin,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const RegisterPage(),
  ),
  GetPage(
    name: const ComicCategoryPage().routeName,
    page: () => const ComicCategoryPage(),
    binding: ComicCategoryBinding(),
  ),
  GetPage(
    name: const ComicExplorePage().routeName,
    page: () => const ComicExplorePage(),
    binding: ComicExploreBinding(),
  ),
  GetPage(
    name: const ComicDetailPage().routeName,
    page: () => const ComicDetailPage(),
    binding: ComicDetailBinding(),
  ),
  GetPage(
    name: const ComicReadPage().routeName,
    page: () => const ComicReadPage(),
    binding: ComicReadBinding(),
  ),
];
