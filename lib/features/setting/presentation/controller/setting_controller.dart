import 'package:bookara/core/data/local/app_get_storage.dart';
import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:bookara/core/utils/mixin_controller/language_mixin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController with LanguageMixinController {
  RxBool isNotificationEnabled = AppGetStorage.isNotificationEnabled().obs;

  void toggleNotification(bool value) async {
    isNotificationEnabled.value = value;

    Get.showOverlay(
      asyncFunction: () async {
        await NotificationService().toggleNotification(value);
      },
      loadingWidget: const Center(child: CircularProgressIndicator()),
    );
  }
}
