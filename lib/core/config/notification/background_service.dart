import 'dart:async';
import 'dart:ui';
import 'package:bookara/core/config/const/notification_constants.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initialBackgroundService() async {
  final service = FlutterBackgroundService();

  // Tạo kênh thông báo cho Android
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    NotificationConstants.notificationChannelId,
    NotificationConstants.defaultNotificationChannelName,
    importance: Importance.min,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  // Cấu hình dịch vụ nền
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: NotificationConstants.notificationChannelId,
      foregroundServiceNotificationId: NotificationConstants.notificationId,
    ),
    iosConfiguration: IosConfiguration(),
  );

  await service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.setAsForegroundService();

    // 👇 Lắng nghe sự kiện stopService
    service.on("stopService").listen((event) {
      service.stopSelf();
    });
  }
}
