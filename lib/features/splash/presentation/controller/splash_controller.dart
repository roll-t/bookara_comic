import 'package:bookara/core/utils/mixin_controller/loading_mixin_controller.dart';
import 'package:bookara/features/main/presentation/page/main_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with LoadingMixinController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    setLoadingState(true);
    await Future.delayed(const Duration(seconds: 0));
    setLoadingState(false);
    Get.offAndToNamed(MainPage.routeName);
  }
}
