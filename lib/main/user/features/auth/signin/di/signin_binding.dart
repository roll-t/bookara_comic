import 'package:auto_find/main/user/features/auth/signin/presentation/controller/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}
