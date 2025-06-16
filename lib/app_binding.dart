import 'package:bookara/core/services/network/api_client.dart';
import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:bookara/features/splash/presentation/controller/splash_controller.dart';
import 'package:bookara/features/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => NotificationService(), fenix: true);
    Get.lazyPut(() => SplashController());
  }
}
