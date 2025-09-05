import 'package:auto_find/main/showroom/data/model/car_model.dart';

class ListModel {
  final List<CarModel> items;
  final String? nextPageToken;

  ListModel({
    required this.items,
    this.nextPageToken,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    final List<CarModel> cars = (json['items'] as List<dynamic>?)
            ?.map((e) => CarModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return ListModel(
      items: cars,
      nextPageToken: json['nextPageToken'] as String?,
    );
  }
}
