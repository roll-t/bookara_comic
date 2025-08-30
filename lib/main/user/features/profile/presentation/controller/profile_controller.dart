import 'package:auto_find/main/user/features/auth/login/presentation/page/login_page.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ///---> [Events]
  void onLogOut() {
    Get.offAllNamed(const LoginPage().routeName);
  }
}
