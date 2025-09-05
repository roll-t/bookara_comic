import 'package:auto_find/core/extension/empty_extension.dart';
import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/ui/widgets/bottom_sheet/select_bottom_sheet_widget.dart';
import 'package:auto_find/core/ui/widgets/expand/expand_controller.dart';
import 'package:auto_find/core/utils/mixin_controller/argument_handle_mixin_controller.dart';
import 'package:auto_find/core/utils/time_utils.dart';
import 'package:auto_find/main/showroom/data/model/car_model.dart';
import 'package:auto_find/main/showroom/domain/usecase/car_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CarDetailController extends GetxController
    with ArgumentHandlerMixinController<CarModel> {
  final CarUsecase _carUsecase;

  CarDetailController(this._carUsecase);

  /// observable lưu chi tiết xe
  Rxn<CarModel> carDetail = Rxn<CarModel>();
  RxBool isLoading = false.obs;

  /// UI States
  final expandInformation = ExpandController();
  final expandVehicle = ExpandController();

  RxString selectedBrand = ''.obs;
  RxString selectedTypeCar = ''.obs;
  RxString selectedColor = ''.obs;
  RxString selectedModel = ''.obs;
  RxString selectedStatus = ''.obs;

  RxBool isEditMode = false.obs;

  final List<String> brandList = [
    "Toyota",
    "Honda",
    "Hyundai",
    "Ford",
    "Mazda",
    "VinFast",
  ];
  final List<String> typeCarList = [
    "Sedan",
    "SUV",
    "Hatchback",
    "Pickup",
    "MPV",
    "Coupe",
  ];
  final List<String> colorList = [
    "Đỏ",
    "Trắng",
    "Đen",
    "Xám",
    "Xanh",
    "Vàng",
  ];
  final List<String> modelList = [
    "Standard",
    "Luxury",
    "Premium",
    "Sport",
  ];
  final List<String> statusList = [
    "Xe mới",
    "Xe đã qua sử dụng",
    "Xe trưng bày",
  ];

  @override
  void onReady() {
    initializedData();
  }

  void initializedData() {
    bool hasArg = handleArgumentFromGet();
    print(hasArg);
    print(argsData?.toJson());
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

      /// fill sẵn data vào UI
      selectedBrand.value = car.brand.orNA();
      selectedColor.value = car.color.orNA();
      selectedTypeCar.value = car.type.orNA();
      selectedModel.value = car.product.orNA();
      selectedStatus.value = car.status.orNA();
    } catch (e) {
      print("❌ Lỗi khi fetchCarDetail: $e");
      Get.snackbar("Lỗi", "Không thể lấy thông tin xe");
    } finally {
      isLoading.value = false;
    }
  }

  /// Toggle edit mode
  void toggleEditMode() {
    if (!TimeUtils.canPerformAction(cooldownMs: 500)) {
      return;
    }

    if (!isEditMode.value) {
      Fluttertoast.showToast(msg: "Bật chế độ chỉnh sửa");
    } else {
      Fluttertoast.showToast(msg: "Tắt chế độ chỉnh sửa");
    }
    isEditMode.value = !isEditMode.value;
  }

  /// Select helpers
  void selectBrand(ItemModel brand) => selectedBrand.value = brand.title.orNA();
  void selectTypeCar(ItemModel type) =>
      selectedTypeCar.value = (type.title).orNA();
  void selectColor(ItemModel color) => selectedColor.value = color.title.orNA();
  void selectModel(ItemModel model) => selectedModel.value = model.title.orNA();
  void selectStatus(ItemModel status) =>
      selectedStatus.value = status.title.orNA();

  /// BottomSheets
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
        onSelected: selectBrand,
      );

  void showTypeCarBottomSheet() => showSelectBottomSheet(
        title: "Chọn loại xe",
        list: typeCarList,
        onSelected: selectTypeCar,
      );

  void showColorBottomSheet() => showSelectBottomSheet(
        title: "Chọn màu xe",
        list: colorList,
        onSelected: selectColor,
      );

  void showModelBottomSheet() => showSelectBottomSheet(
        title: "Chọn mẫu xe",
        list: modelList,
        onSelected: selectModel,
      );

  void showStatusBottomSheet() => showSelectBottomSheet(
        title: "Chọn trạng thái xe",
        list: statusList,
        onSelected: selectStatus,
      );

  @override
  void onClose() {
    expandInformation.dispose();
    expandVehicle.dispose();
    super.onClose();
  }
}
