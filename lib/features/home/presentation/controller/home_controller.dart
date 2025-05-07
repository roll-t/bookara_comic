import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentPage = 0.obs;

  onChangePage(int index) {
    currentPage.value = index;
  }
}
