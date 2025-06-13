import 'package:bookara/core/config/notification/notification_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void onNotify() {
    final testMessage = const RemoteMessage(
      notification: RemoteNotification(
        title: 'Thông báo thử nghiệm',
        body: 'Đây là nội dung của thông báo.',
      ),
    );
    NotificationService.showLocalNotification(testMessage);
  }

  void addNotification(String title, String message) {
    FirebaseDatabase.instance.ref("notifications").push().set({
      'title': title,
      'message': message,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
