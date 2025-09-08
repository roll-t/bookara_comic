import 'dart:convert';

import 'package:auto_find/core/model/ui/item_model.dart';

class TypeCarModel {
  final int id;
  final String name;
  final String status;

  TypeCarModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory TypeCarModel.fromJson(Map<String, dynamic> json) {
    return TypeCarModel(
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

  /// Convert từ chuỗi JSON → List<TypeCarModel>
  static List<TypeCarModel> listFromJson(String str) {
    final data = json.decode(str) as List<dynamic>;
    return data.map((e) => TypeCarModel.fromJson(e)).toList();
  }

  /// 🔹 Convert TypeCarModel -> ItemModel
  ItemModel toItemModel() {
    return ItemModel(
      id: id.toString(),
      title: name,
    );
  }
}
