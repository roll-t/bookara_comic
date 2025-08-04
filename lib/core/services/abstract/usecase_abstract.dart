import 'package:get/get.dart';

abstract class UsecaseAbs<TRepo, TDbController> {
  final TRepo repository = Get.find<TRepo>();
  final TDbController dbController = Get.find<TDbController>();
}
