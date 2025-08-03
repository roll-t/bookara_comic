import 'package:bookara/core/services/API/comic_api.dart';
import 'package:get/get.dart';

class ComicController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    final ComicApi _api = ComicApi();
    print(">>> API result ${_api.getCategories()}");
  }
}
