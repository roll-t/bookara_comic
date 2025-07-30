import 'package:bookara/core/data/model/item_model.dart';
import 'package:bookara/core/ui/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  BottomSheetController filterChartSheetController = BottomSheetController(
    hasSearch: false,
    listItem: [
      ItemModel(title: "Tất cả"),
      ItemModel(title: "Quản lý xe"),
      ItemModel(title: "Quản lý lợi nhuận"),
      ItemModel(title: "Quản lý nhân sự"),
    ].obs,
    itemSelected: ItemModel(title: "Tất cả"),
  );

  BottomSheetController yearBottomSheetController = BottomSheetController(
    listItem: [
      ItemModel(title: "Năm 2025"),
      ItemModel(title: "Năm 2024"),
      ItemModel(title: "Năm 2023"),
      ItemModel(title: "Năm 2022"),
      ItemModel(title: "Năm 2021"),
      ItemModel(title: "Năm 2020"),
      ItemModel(title: "Năm 2019"),
      ItemModel(title: "Năm 2018"),
    ].obs,
  );

  BottomSheetController monthBottomSheetController = BottomSheetController(
    listItem: List.generate(
      12,
      (index) => ItemModel(title: "Tháng ${index + 1}"),
    ).obs,
  );

  BottomSheetController currencyBottomSheetController = BottomSheetController(
    listItem: [
      ItemModel(title: "VND - Đồng"),
      ItemModel(title: "Ngàn đồng"),
      ItemModel(title: "Triệu đồng"),
      ItemModel(title: "Tỷ đồng"),
    ].obs,
  );

}
