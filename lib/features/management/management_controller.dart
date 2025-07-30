import 'package:bookara/features/main/model/item_menu_feature_model.dart';
import 'package:get/get.dart';

class ManagementController extends GetxController {
  final List<ItemMenuFeatureModel> listMoneyFeature = [
    ItemMenuFeatureModel(
      title: "Thống kê thu chi từng mảng",
    ),
    ItemMenuFeatureModel(
      title: "Báo cáo theo\nTuần - Tháng",
    ),
  ];

  final List<ItemMenuFeatureModel> listCreditFeature = [
    ItemMenuFeatureModel(
      title: "20\n Khoản vay",
    ),
    ItemMenuFeatureModel(
      title: "Gốc - Lãi\nHàng tháng",
    ),
    ItemMenuFeatureModel(
      title: "Báo cáo tổng nợ",
    ),
  ];
}
