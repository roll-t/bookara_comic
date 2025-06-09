import 'package:bookara/app_binding.dart';
import 'package:bookara/core/lang/translation_service.dart';
import 'package:bookara/core/service/firebase/realtime_service.dart';
import 'package:bookara/core/storage/app_get_storage.dart';
import 'package:bookara/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'background_service.dart';

Future<void> configs() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Khởi tạo Firebase Messaging
  await NotificationService.initialize();

  await initialBackgroundService();

  // Cấu hình thông báo realtime
  listenToRealtimeDatabase();

  await AppGetStorage.init();

  // Lấy ngôn ngữ mặc định, mặc định là tiếng Anh
  String language = AppGetStorage.getLanguage();

  // Thiết lập ngôn ngữ sử dụng dịch vụ localization của bạn
  LocalizationService.changeLocale(language == 'English' ? 'en' : 'vi');

  // Ví dụ sử dụng
  AppGetStorage.printCacheSize();

  // Khởi tạo các ràng buộc
  AppBinding().dependencies();
}
