// ignore: file_names
import 'package:get/get.dart';

/// Abstract tổng quát cho controller quản lý dữ liệu local
abstract class DbControllerAbstract<T> extends GetxController {
  
  /// Dữ liệu hiện tại
  final items = <T>[].obs;
  /// Lưu dữ liệu (RAM + Storage)
  void saveItems(List<T> list);

  /// Load dữ liệu từ Storage
  List<T> loadItems();

  /// Xoá toàn bộ dữ liệu
  void clearItems() {
    items.clear();
  }

  /// Lấy toàn bộ dữ liệu hiện tại
  List<T> get all => items;

  /// Thêm một phần tử
  void addItem(T item) {
    items.add(item);
  }

  /// Xoá một phần tử
  void removeItem(T item) {
    items.remove(item);
  }

  /// Cập nhật một phần tử dựa trên điều kiện
  void updateItem(bool Function(T) test, T newItem) {
    final index = items.indexWhere(test);
    if (index != -1) {
      items[index] = newItem;
      items.refresh();
    }
  }
}
