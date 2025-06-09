import 'package:bookara/background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUtils {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
          '@drawable/ic_logo',
        ); // đảm bảo có icon này

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(initializationSettings);
  }

  /// Hiển thị thông báo cục bộ
  // static Future<void> showLocalNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidDetails =
  //       AndroidNotificationDetails(
  //         'default_channel_id',
  //         'Default Channel',
  //         channelDescription: 'This channel is used for default notifications.',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         icon: '@drawable/ic_logo',
  //       );

  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidDetails,
  //   );

  //   await _notificationsPlugin.show(
  //     message.hashCode,
  //     message.notification?.title ?? 'Thông báo',
  //     message.notification?.body ?? '',
  //     notificationDetails,
  //   );
  // }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      "default_channel_id",
      'MY FOREGROUND SERVICE',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@drawable/i_logo',
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // ID riêng cho mỗi lần
      title,
      body,
      notificationDetails,
    );
  }
}
