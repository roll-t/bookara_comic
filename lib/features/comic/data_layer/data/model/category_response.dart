import 'package:bookara/features/comic/data_layer/data/model/category_comic_model.dart';

class CategoryResponse {
  final List<CategoryComicModel> items;

  CategoryResponse({
    required this.items,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      items: (json['items'] as List)
          .map((e) => CategoryComicModel.fromJson(e))
          .toList(),
    );
  }
}
