import 'package:auto_find/core/config/const/app_logger.dart';
import 'package:auto_find/core/extension/empty_extension.dart';
import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/select_bottom_sheet_widget.dart';
import 'package:auto_find/core/ui/widgets/expand/expand_controller.dart';
import 'package:auto_find/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:auto_find/core/utils/time_utils.dart';
import 'package:auto_find/main/showroom/data/model/car_model.dart';
import 'package:auto_find/main/showroom/domain/usecase/car_usecase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CarDetailController extends GetxController
    with ArgumentHandlerMixinController<CarModel> {
  final CarUsecase _carUsecase;
  CarDetailController(this._carUsecase);

  /// observable lưu chi tiết xe
  Rxn<CarModel> carDetail = Rxn<CarModel>();
  RxBool isLoading = true.obs;
  RxBool isEditMode = false.obs;

  /// UI expand controllers
  final expandInformation = ExpandController();
  final expandVehicle = ExpandController();

  /// --------- TextEditingController cho từng field trong UI ----------
  final nameController = TextEditingController(); // tên xe
  final plateController = TextEditingController(); // biển số
  final releaseYearController = TextEditingController(); // năm sx
  final priceController = TextEditingController(); // giá niêm yết bán
  final profitController = TextEditingController(); // lợi nhuận

  // mua
  final importDateController = TextEditingController();
  final importPriceController = TextEditingController();
  final importCostController = TextEditingController();

  // bán
  final soldDateController = TextEditingController();
  final soldPriceController = TextEditingController();
  final soldCostController = TextEditingController();

  // dropdown (hãng xe, loại xe, màu xe, mẫu xe, trạng thái)
  RxString selectedBrand = ''.obs;
  RxString selectedTypeCar = ''.obs;
  RxString selectedColor = ''.obs;
  RxString selectedModel = ''.obs;
  RxString selectedStatus = ''.obs;

  // 🔽 Thêm controller cho dropdown
  final brandController = TextEditingController();
  final typeCarController = TextEditingController();
  final colorController = TextEditingController();
  final modelController = TextEditingController();
  final statusController = TextEditingController();

  /// Dropdown list có sẵn
  final List<String> brandList = [
    "Toyota",
    "Honda",
    "Hyundai",
    "Ford",
    "Mazda",
    "VinFast"
  ];
  final List<String> typeCarList = [
    "Sedan",
    "SUV",
    "Hatchback",
    "Pickup",
    "MPV",
    "Coupe"
  ];
  final List<String> colorList = ["Đỏ", "Trắng", "Đen", "Xám", "Xanh", "Vàng"];
  final List<String> modelList = ["Standard", "Luxury", "Premium", "Sport"];
  final List<String> statusList = [
    "Xe mới",
    "Xe đã qua sử dụng",
    "Xe trưng bày"
  ];

  @override
  void onReady() {
    initializedData();
  }

  void initializedData() {
    bool hasArg = handleArgumentFromGet();
    if (hasArg) {
      fetchCarDetail(argsData?.id ?? 0);
    }
  }

  /// Gọi API lấy chi tiết xe
  Future<void> fetchCarDetail(int id) async {
    try {
      isLoading.value = true;
      final car = await _carUsecase.getCarDetail(id);
      carDetail.value = car;
      print(">>> Car Detail: ${car.toJson()}");

      /// ---- Fill dữ liệu vào controller ----
      nameController.text = car.name.orNA();
      plateController.text = car.plate.orNA();
      releaseYearController.text = car.releaseYear.toString();

      priceController.text = (car.price ?? 0).toString();
      profitController.text = (car.profit ?? 0).toString();

      importDateController.text = car.importDate.toString();
      importPriceController.text = (car.importPrice ?? 0).toString();
      importCostController.text = (car.importCost ?? 0).toString();

      soldDateController.text = car.soldDate.toString();
      soldPriceController.text = (car.soldPrice ?? 0).toString();
      soldCostController.text = (car.soldCost ?? 0).toString();

      // ---- Fill dropdown ----
      selectedBrand.value = car.brand.orNA();
      brandController.text = selectedBrand.value;

      selectedColor.value = car.color.orNA();
      colorController.text = selectedColor.value;

      selectedTypeCar.value = car.type.orNA();
      typeCarController.text = selectedTypeCar.value;

      selectedModel.value = car.product.orNA();
      modelController.text = selectedModel.value;

      selectedStatus.value = car.status.orNA();
      statusController.text = selectedStatus.value;
    } catch (e) {
      print("❌ Lỗi khi fetchCarDetail: $e");
      Get.snackbar("Lỗi", "Không thể lấy thông tin xe");
    } finally {
      isLoading.value = false;
      update(["FORM_ID"]);
    }
  }

  void toggleEditMode() {
    if (!TimeUtils.canPerformAction(cooldownMs: 500)) return;
    Fluttertoast.showToast(
      msg: isEditMode.value ? "Tắt chế độ chỉnh sửa" : "Bật chế độ chỉnh sửa",
    );
    isEditMode.value = !isEditMode.value;
    update([
      "EDIT_ICON_ID",
      "FORM_ID",
    ]);
  }

  /// Chọn dropdown
  void showSelectBottomSheet({
    required String title,
    required List<String> list,
    required void Function(ItemModel item) onSelected,
  }) {
    SelectBottomSheet.show(
      title: title,
      items: list.map((e) => ItemModel(title: e)).toList(),
      onSelected: onSelected,
    );
  }

  void showBrandBottomSheet() => showSelectBottomSheet(
        title: "Chọn hãng xe",
        list: brandList,
        onSelected: (item) {
          selectedBrand.value = item.title.orNA();
          brandController.text = selectedBrand.value;
        },
      );

  void showTypeCarBottomSheet() => showSelectBottomSheet(
        title: "Chọn loại xe",
        list: typeCarList,
        onSelected: (item) {
          selectedTypeCar.value = item.title.orNA();
          typeCarController.text = selectedTypeCar.value;
        },
      );

  void showColorBottomSheet() => showSelectBottomSheet(
        title: "Chọn màu xe",
        list: colorList,
        onSelected: (item) {
          selectedColor.value = item.title.orNA();
          colorController.text = selectedColor.value;
        },
      );

  void showModelBottomSheet() => showSelectBottomSheet(
        title: "Chọn mẫu xe",
        list: modelList,
        onSelected: (item) {
          selectedModel.value = item.title.orNA();
          modelController.text = selectedModel.value;
        },
      );

  void showStatusBottomSheet() => showSelectBottomSheet(
        title: "Chọn trạng thái xe",
        list: statusList,
        onSelected: (item) {
          selectedStatus.value = item.title.orNA();
          statusController.text = selectedStatus.value;
        },
      );

  /// Cập nhật thông tin cơ bản của xe
  Future<void> updateCarInfo() async {
    try {
      if (carDetail.value == null) return;
      final updatedCar = carDetail.value!.copyWith(
        name: nameController.text,
        plate: plateController.text,
        releaseYear: int.tryParse(releaseYearController.text),
        brand: selectedBrand.value,
        type: selectedTypeCar.value,
        color: selectedColor.value,
        product: selectedModel.value,
        status: selectedStatus.value,
        price: double.tryParse(priceController.text),
        profit: double.tryParse(profitController.text),
        des: carDetail.value?.des, // giữ nguyên nếu chưa cho sửa mô tả
      );

      await _carUsecase.updateCar(updatedCar);
      carDetail.value = updatedCar;
      update(["FORM_ID"]);
    } catch (e) {
      AppLogger.e("❌ updateCarInfo error: $e");
    }
  }

  /// Cập nhật thông tin mua bán xe
  Future<void> updateTransactionInfo() async {
    try {
      if (carDetail.value == null) return;

      final updatedCar = carDetail.value!.copyWith(
        importDate: DateTime.tryParse(importDateController.text),
        importPrice: double.tryParse(importPriceController.text),
        importCost: double.tryParse(importCostController.text),
        soldDate: DateTime.tryParse(soldDateController.text),
        soldPrice: double.tryParse(soldPriceController.text),
        soldCost: double.tryParse(soldCostController.text),
        soldDes: carDetail.value?.soldDes,
        profit: double.tryParse(profitController.text),
      );

      await _carUsecase.updateCar(updatedCar);
      carDetail.value = updatedCar;
      update(["FORM_ID"]);

      Fluttertoast.showToast(msg: "Cập nhật thông tin mua/bán thành công ✅");
    } catch (e) {
      AppLogger.e("❌ updateTransactionInfo error: $e");
      Fluttertoast.showToast(msg: "Lỗi khi cập nhật thông tin mua/bán");
    }
  }

  @override
  void onClose() {
    expandInformation.dispose();
    expandVehicle.dispose();
    nameController.dispose();
    plateController.dispose();
    releaseYearController.dispose();
    priceController.dispose();
    profitController.dispose();
    importDateController.dispose();
    importPriceController.dispose();
    importCostController.dispose();
    soldDateController.dispose();
    soldPriceController.dispose();
    soldCostController.dispose();

    // dispose dropdown controllers
    brandController.dispose();
    typeCarController.dispose();
    colorController.dispose();
    modelController.dispose();
    statusController.dispose();

    super.onClose();
  }
}
