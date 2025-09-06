import 'package:auto_find/core/config/const/app_enum.dart';
import 'package:auto_find/core/config/result.dart';
import 'package:auto_find/core/services/network/api_client.dart';
import 'package:auto_find/core/services/network/api_endpoint.dart';
import 'package:auto_find/main/showroom/data/model/car_model.dart';
import 'package:get/get.dart';

class CarApi {
  final ApiClient _client = Get.find<ApiClient>();

  Future<Result> getCars({
    int pageSize = 20,
    String? startAfter,
  }) {
    final query = {
      'pageSize': pageSize,
      if (startAfter != null) 'startAfter': startAfter,
    };
    return _client.get(ApiEndpoint.cars, query: query);
  }

  /// Lấy toàn bộ xe (ẩn soft-delete)
  Future<Result> getAllCars({String? sort}) {
    final query = {
      if (sort != null) 'sort': sort,
    };
    return _client.get(ApiEndpoint.allCars, query: query);
  }

  /// Lấy chi tiết xe theo ID
  Future<Result> getCarDetail(int carId) {
    return _client.get(ApiEndpoint.carDetail(carId));
  }

  /// Tạo xe mới
  Future<Result> createCar(CarModel car) {
    return _client.post(
      ApiEndpoint.cars,
      data: car.toJson(),
    );
  }

/// Cập nhật xe
Future<Result> updateCar(int carId, CarModel car) async {
  final response = await _client.put(
    ApiEndpoint.carDetail(carId),
    data: car.toJson(),
  );

  if (response.data is Map<String, dynamic>) {
    return Result(
      status: Results.success,
      data: response.data["data"],
      message: response.data["message"]?.toString(),
    );
  }

  return Result(
    status: Results.error,
    data: null,
    message: "Phản hồi không hợp lệ",
  );
}

  /// Xoá mềm xe
  Future<Result> deleteCar(int carId) {
    return _client.delete(ApiEndpoint.carDetail(carId));
  }

  /// Lấy danh sách xe đã bán
  Future<Result> getSoldCars() {
    return _client.get(ApiEndpoint.carsSold);
  }

  /// Lấy danh sách xe đang ở showroom
  Future<Result> getShowroomCars() {
    return _client.get(ApiEndpoint.carsShowroom);
  }

  /// Lấy danh sách xe đã nhập (sort theo ngày nhập)
  Future<Result> getImportedCars() {
    return _client.get(ApiEndpoint.carsImported);
  }

  /// Lấy dữ liệu biểu đồ (năm bắt buộc)
  Future<Result> getCharts({required int year}) {
    final query = {'year': year};
    return _client.get(ApiEndpoint.carsCharts, query: query);
  }

  /// Bảng lợi nhuận dạng ma trận
  Future<Result> getProfitMatrix({int? year, int? month}) {
    final query = {
      if (year != null) 'year': year,
      if (month != null) 'month': month,
    };
    return _client.get(ApiEndpoint.carsProfitMatrix, query: query);
  }

  /// Top 5 thương hiệu lợi nhuận cao nhất
  Future<Result> getTopBrands() {
    return _client.get(ApiEndpoint.carsTopBrands);
  }

  /// Top 5 sản phẩm lợi nhuận cao nhất
  Future<Result> getTopProducts() {
    return _client.get(ApiEndpoint.carsTopProducts);
  }

  /// Top 5 xe lợi nhuận cao nhất
  Future<Result> getTopProfit() {
    return _client.get(ApiEndpoint.carsTopProfit);
  }

  /// Top 5 xe có giá trị cao nhất
  Future<Result> getTopValue() {
    return _client.get(ApiEndpoint.carsTopValue);
  }

  /// Top 5 xe đã bán gần đây
  Future<Result> getTopRecent() {
    return _client.get(ApiEndpoint.carsTopRecent);
  }
}
