import 'package:auto_find/core/local_storage/app_get_storage.dart';

Future<void> storageConfigs() async {
  await AppGetStorage.init();
  AppGetStorage.printCacheSize();
}
