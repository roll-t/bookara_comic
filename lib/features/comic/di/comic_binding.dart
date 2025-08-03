import 'package:bookara/features/comic/presentation/controller/comic_controller.dart';
import 'package:get/get.dart';

class ComicBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ComicController());
  }
}
