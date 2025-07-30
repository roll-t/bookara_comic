import 'package:bookara/core/config/const/app_icons.dart';
import 'package:bookara/features/main/model/item_menu_feature_model.dart';
import 'package:get/get.dart';

class ManagementController extends GetxController {
  final List<ItemMenuFeatureModel> listMoneyFeature = [
    ItemMenuFeatureModel(
      title: "Thống kê thu chi từng mảng",
      iconUrl: AppIcons.icIncomeExpenseByCategory,
    ),
    ItemMenuFeatureModel(
      title: "Báo cáo theo\nTuần - Tháng",
      iconUrl: AppIcons.icReportWeeklyMonthly,
    ),
  ];

  final List<ItemMenuFeatureModel> listCreditFeature = [
    ItemMenuFeatureModel(
      title: "20\n Khoản vay",
      iconUrl: AppIcons.ic20Loan,
    ),
    ItemMenuFeatureModel(
      title: "Gốc - Lãi\nHàng tháng",
      iconUrl: AppIcons.icMonthlyPrincipalInterest,
    ),
    ItemMenuFeatureModel(
      title: "Báo cáo tổng nợ",
      iconUrl: AppIcons.icReportDebt,
    ),
  ];
}
