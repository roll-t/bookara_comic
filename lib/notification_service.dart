import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Hàm xử lý thông báo khi ứng dụng ở chế độ nền hoặc bị đóng
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    log('🔔 [Background] Message ID: ${message.messageId}');
  }

  /// Khởi tạo FCM và đăng ký các listener
  static Future<void> initialize() async {
    // Yêu cầu quyền nhận thông báo
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('🔔 Notification permission status: ${settings.authorizationStatus}');

    // Lấy token thiết bị
    String? token = await _messaging.getToken();
    log("🔑 FCM Token: $token");

    // Cấu hình cho Android
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/i_logo');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(initSettings);

    // Lắng nghe thông báo khi ứng dụng đang ở foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('📩 [Foreground] Message: ${message.notification?.title}');
      showLocalNotification(message);
    });

    // Lắng nghe khi người dùng mở ứng dụng từ thông báo
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('📬 [OpenedApp] Message: ${message.notification?.title}');
    });

    // Xử lý khi ứng dụng được mở từ trạng thái bị đóng hoàn toàn
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      log('📥 [InitialMessage] Message: ${initialMessage.notification?.title}');
    }

    // Đăng ký hàm xử lý thông báo ở chế độ nền
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  /// Hiển thị thông báo cục bộ
  static Future<void> showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'default_channel_id',
          'Default Channel',
          channelDescription: 'This channel is used for default notifications.',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      message.hashCode,
      message.notification?.title ?? 'Thông báo',
      message.notification?.body ?? '',
      notificationDetails,
    );
  }
}
