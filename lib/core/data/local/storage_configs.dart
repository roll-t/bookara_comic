import 'package:bookara/core/data/local/app_get_storage.dart';

Future<void> storageConfigs() async {
  await AppGetStorage.init();
  AppGetStorage.printCacheSize();
}
