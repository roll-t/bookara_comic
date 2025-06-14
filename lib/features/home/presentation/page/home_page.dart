import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookara/features/home/presentation/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang Chủ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(labelText: 'Tiêu đề'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.messageController,
              decoration: const InputDecoration(labelText: 'Nội dung'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      controller.titleController.clear();
                      controller.messageController.clear();
                    },
                    child: const Text('Hủy'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addNotification(
                        controller.titleController.text,
                        controller.messageController.text,
                      );
                      controller.titleController.clear();
                      controller.messageController.clear();
                    },
                    child: const Text('Gửi'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: controller.onNotify,
                child: const Text('Hiển thị Thông báo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
