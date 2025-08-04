import 'package:bookara/features/comic/data_layer/data/db_controller/db_category_comic_controller.dart';
import 'package:bookara/features/comic/data_layer/data/db_controller/db_comic_controller.dart';
import 'package:bookara/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());

    ///---> [Binding handle API data - controller]
    /* Create storage data for comic */
    Get.put(
      DbComicController(),
      permanent: true,
    );

    /* Create storage data for 'Category' comic */
    Get.put(
      DbCategoryComicController(),
      permanent: true,
    );
  }
}
