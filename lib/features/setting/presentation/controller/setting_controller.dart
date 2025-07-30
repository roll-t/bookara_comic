import 'package:bookara/core/data/local/app_get_storage.dart';
import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:bookara/core/ui/widgets/loadings/loading_utils.dart';
import 'package:bookara/core/utils/mixin_controller/language_mixin_controller.dart';
import 'package:get/get.dart';

class SettingController extends GetxController with LanguageMixinController {
  final RxBool isNotificationEnabled =
      AppGetStorage.isNotificationEnabled().obs;

  void toggleNotification(bool value) {
    if (isNotificationEnabled.value == value) return;

    isNotificationEnabled.value = value;

    LoadingUtils.showOverlayLoading(
      asyncFunction: () => NotificationService().toggleNotification(value),
    );
  }
}
