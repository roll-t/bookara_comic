import 'dart:convert';

import 'package:auto_find/core/model/ui/item_model.dart';

class BrandCarModel {
  final int id;
  final String name;
  final List<ProductModel> products;
  final String status;

  BrandCarModel({
    required this.id,
    required this.name,
    required this.products,
    required this.status,
  });

  factory BrandCarModel.fromJson(Map<String, dynamic> json) {
    return BrandCarModel(
      id: json['id'],
      name: json['name'],
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'products': products.map((e) => e.toJson()).toList(),
      'status': status,
    };
  }

  static List<BrandCarModel> listFromJson(String str) {
    final data = json.decode(str) as List<dynamic>;
    return data.map((e) => BrandCarModel.fromJson(e)).toList();
  }

  ItemModel toItemModel() {
    return ItemModel(
      id: id.toString(),
      title: name,
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String status;

  ProductModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}
