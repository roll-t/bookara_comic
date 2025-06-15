import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final messageController = TextEditingController();

  /// Hiển thị thông báo cục bộ (không phụ thuộc Firebase)
  void onNotify() {
    final title = titleController.text.trim();
    final message = messageController.text.trim();

    if (title.isEmpty && message.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng nhập tiêu đề hoặc nội dung");
      return;
    }

    showNotification(
      title: title.isNotEmpty ? title : 'Thông báo',
      body: message,
    );
  }

  /// Gửi thông báo qua Firebase Realtime Database
  Future<void> addNotification(String title, String message) async {
    if (title.trim().isEmpty || message.trim().isEmpty) {
      Get.snackbar("Lỗi", "Không được để trống tiêu đề hoặc nội dung");
      return;
    }

    final notiRef = FirebaseDatabase.instance.ref("notifications");
    await notiRef.push().set({
      'title': title,
      'message': message,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  @override
  void onClose() {
    titleController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
