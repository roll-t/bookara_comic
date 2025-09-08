import 'package:auto_find/main/showroom/data/model/brand_car_model.dart';

class ListBrandModel {
  final List<BrandCarModel> items;
  final String? nextPageToken;

  ListBrandModel({
    required this.items,
    this.nextPageToken,
  });

  factory ListBrandModel.fromJson(Map<String, dynamic> json) {
    return ListBrandModel(
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => BrandCarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'nextPageToken': nextPageToken,
    };
  }

  ListBrandModel copyWith({
    List<BrandCarModel>? items,
    String? nextPageToken,
  }) {
    return ListBrandModel(
      items: items ?? this.items,
      nextPageToken: nextPageToken ?? this.nextPageToken,
    );
  }
}
