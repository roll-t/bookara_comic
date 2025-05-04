import 'package:bookara/app_binding.dart';
import 'package:bookara/core/lang/translation_service.dart';
import 'package:bookara/core/storage/app_get_storage.dart';
import 'package:flutter/material.dart';

Future<void> configs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppGetStorage.init();

  // Get language setting default is  English
  String language = AppGetStorage.getLanguage();
  // Set the language using your localization service
  LocalizationService.changeLocale(language == 'English' ? 'en' : 'vi');

  // Ví dụ sử dụng
  AppGetStorage.printCacheSize();

  // Initialize bindings
  AppBinding().dependencies();
}
