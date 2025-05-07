import 'package:bookara/core/routes/app_routes.dart';
import 'package:bookara/core/utils/mixin_controller/loading_mixin_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with LoadingMixinController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  // Hàm điều hướng đến trang home với hiệu ứng chờ
  void _navigateToHome() async {
    setLoadingState(true);
    await Future.delayed(const Duration(seconds: 1));
    setLoadingState(false);
    Get.offAndToNamed(
      AppRoutes.home,
    ); // sau khi loading thành công di chuyển đến trang home
  }
}
