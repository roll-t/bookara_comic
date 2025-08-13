import 'package:bookara/features/navigation/presentation/page/navigation_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(const NavigationPage().routeName);
      },
    );
  }
}
