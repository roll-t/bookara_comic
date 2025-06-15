import 'package:bookara/app_binding.dart';
import 'package:bookara/core/config/app_logger.dart';
import 'package:bookara/core/config/load_env.dart';
import 'package:bookara/core/data/local/storage_configs.dart';
import 'package:bookara/core/lang/language_configs.dart';
import 'package:bookara/core/services/firebase/firebase_config.dart';
import 'package:bookara/core/services/notification/notification_config.dart';
import 'package:flutter/material.dart';

Future<void> configs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv();
  AppLogger.init();
  AppBinding().dependencies();
  await storageConfigs();
  await firebaseConfigs();
  await notificationConfigs();
  await languageConfigs();
}
