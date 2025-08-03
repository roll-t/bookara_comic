import 'package:get/get.dart';

abstract class UsecaseAbs<TRepo> {
  final TRepo repository = Get.find<TRepo>();
}
