import 'package:bookara/core/services/abstract/DB_controller_abstract.dart';
import 'package:bookara/features/comic/data_layer/data/model/comic_model.dart';
import 'package:get/get.dart';

class DbComicController extends DbControllerAbstract<ComicModel> {
  
  @override
  void saveItems(List<ComicModel> list) {
    items.assignAll(list);
  }

  @override
  List<ComicModel> loadItems() {
    return items;
  }
}
