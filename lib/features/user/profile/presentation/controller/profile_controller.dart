import 'package:auto_find/features/user/auth/login/presentation/page/login_page.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ///---> [Events]
  void onLogOut() {
    Get.offAllNamed(const LoginPage().routeName);
  }
}
