import 'package:bookara/core/services/abstract/DB_controller_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';
import 'package:get/get.dart';

class DbCategoryComicController extends DbControllerAbstract<CategoryComicModel> {

  @override
  void saveItems(List<CategoryComicModel> list) {
    items.assignAll(list);
  }

  @override
  List<CategoryComicModel> loadItems() {
    return items;
  }
}
