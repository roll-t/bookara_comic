import 'package:auto_find/main/showroom/data/model/car_model.dart';
import 'package:auto_find/main/showroom/data/model/list_model.dart';
import 'package:auto_find/main/showroom/data/source/car_api.dart';

class CarRepository {
  final CarApi _api = CarApi();

  Future<ListModel> getCars({
    int pageSize = 20,
    String? startAfter,
  }) async {
    final result = await _api.getCars(
      pageSize: pageSize,
      startAfter: startAfter,
    );

    if (result.isSuccess) {
      if (result.data is Map<String, dynamic>) {
        return ListModel.fromJson(result.data as Map<String, dynamic>);
      }
      return ListModel(items: [], nextPageToken: null);
    }
    throw Exception(result.message);
  }

  Future<CarModel> getCarDetail(int id) async {
    final result = await _api.getCarDetail(id);
    if (result.isSuccess) {
      return CarModel.fromJson(result.data);
    }
    throw Exception(result.message);
  }

  Future<void> createCar(CarModel car) async {
    final result = await _api.createCar(car);
    if (!result.isSuccess) throw Exception(result.message);
  }

  Future<void> updateCar(CarModel car) async {
    final result = await _api.updateCar(car.id ?? 0, car);
    if (!result.isSuccess) throw Exception(result.message);
  }

  Future<void> deleteCar(int id) async {
    final result = await _api.deleteCar(id);
    if (!result.isSuccess) throw Exception(result.message);
  }
}
