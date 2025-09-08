import 'dart:convert';

import 'package:auto_find/core/model/ui/item_model.dart';

class ColorModel {
  final int id;
  final String name;
  final String status;

  ColorModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
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

  /// Convert từ chuỗi JSON → List<ColorModel>
  static List<ColorModel> listFromJson(String str) {
    final data = json.decode(str) as List<dynamic>;
    return data.map((e) => ColorModel.fromJson(e)).toList();
  }

  /// 🔹 Convert ColorModel -> ItemModel
  ItemModel toItemModel() {
    return ItemModel(
      id: id.toString(),
      title: name,
    );
  }
}
