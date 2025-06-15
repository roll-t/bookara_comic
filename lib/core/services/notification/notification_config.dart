import 'package:bookara/core/config/app_logger.dart';
import 'package:bookara/core/config/feature_configs.dart';
import 'package:bookara/core/services/firebase/realtime_service.dart';
import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:get/get.dart';

Future<void> notificationConfigs() async {
  final isNotificationEnabled = FeatureConfigs.isNotificationEnabled;
  if (!isNotificationEnabled) {
    AppLogger.w('[notificationConfigs] ❌ Notification feature is disabled via .env');
    return;
  }

  AppLogger.i('[notificationConfigs] ✅ Notification feature is enabled');
  final notificationService = Get.find<NotificationService>();
  await notificationService.initialize();
  listenToRealtimeDatabase();
}
