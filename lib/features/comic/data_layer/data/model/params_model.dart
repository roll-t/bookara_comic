import 'package:bookara/features/comic/data_layer/data/model/pagination_model.dart';

class ParamsModel {
  final String? typeSlug;
  final List<String> filterCategory;
  final String? sortField;
  final String? sortType;
  final PaginationModel pagination;

  ParamsModel({
    this.typeSlug,
    required this.filterCategory,
    this.sortField,
    this.sortType,
    required this.pagination,
  });

  factory ParamsModel.fromJson(Map<String, dynamic> json) {
    return ParamsModel(
      typeSlug: json['type_slug'],
      filterCategory: List<String>.from(json['filterCategory'] ?? []),
      sortField: json['sortField'],
      sortType: json['sortType'],
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }
}
