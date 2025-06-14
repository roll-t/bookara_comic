import 'package:bookara/app_binding.dart';
import 'package:bookara/core/data/local/app_get_storage.dart';
import 'package:bookara/core/lang/translation_service.dart';
import 'package:bookara/core/services/firebase/realtime_service.dart';
import 'package:bookara/core/services/notification/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'core/services/firebase/firebase_options.dart';

Future<void> configs() async {
  await AppGetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Nếu chưa được đăng ký thì mới tạo
  if (!Get.isRegistered<NotificationService>()) {
    Get.put(NotificationService());
  }

  // Sau đó mới gọi hàm
  final notificationService = Get.find<NotificationService>();
  await notificationService.initialize();

  // Cấu hình thông báo realtime
  listenToRealtimeDatabase();

  // Lấy ngôn ngữ mặc định, mặc định là tiếng Anh
  String language = AppGetStorage.getLanguage();

  // Thiết lập ngôn ngữ sử dụng dịch vụ localization của bạn
  LocalizationService.changeLocale(language == 'English' ? 'en' : 'vi');

  // Ví dụ sử dụng
  AppGetStorage.printCacheSize();

  // Khởi tạo các ràng buộc
  AppBinding().dependencies();
}
