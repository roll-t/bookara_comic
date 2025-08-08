import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';

class CategoryResponseModel {
  final List<CategoryComicModel> items;

  CategoryResponseModel({
    required this.items,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(

      items: (json['items'] as List)
          .map((e) => CategoryComicModel.fromJson(e))
          .toList(),
    );
  }
}
