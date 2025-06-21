import 'package:bookara/core/data/model/food_model.dart';
import 'package:bookara/features/home/presentation/controller/home_controller.dart';
import 'package:bookara/features/home/presentation/controller/spinner_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(
      () => SpinnerController(
        foodList: [
          FoodModel(
            title: "Bún bò",
            imageUrl:
                "https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1551438228969-H0FPV1FO3W5B0QL328AS/chup-anh-thuc-an-1.jpg",
          ),
          FoodModel(
            title: "Phở Hà Nội",
            imageUrl:
                "https://th.bing.com/th/id/OIP.MjXQ8F5-vQZWZNNcZvitYwHaFj?rs=1&pid=ImgDetMain",
          ),
          FoodModel(
            title: "Gỏi cuốn",
            imageUrl:
                "https://th.bing.com/th/id/OIP.T_-593biEPSBZLNdzRMjRAHaHa?w=840&h=840&rs=1&pid=ImgDetMain",
          ),
          FoodModel(
            title: "Mì xào",
            imageUrl:
                "https://simple-veganista.com/wp-content/uploads/2013/06/soba-noodle-stir-fry-4-680x910.jpg",
          ),
          FoodModel(
            title: "Cơm chiên",
            imageUrl:
                "https://cdn.tgdd.vn/Files/2019/03/07/1153472/chinese-new-year_600x800.jpg",
          ),
          FoodModel(
            title: "Chả giò",
            imageUrl:
                "https://confirmgood.com/wp-content/uploads/2022/10/67641668_467007407216086_5074179877325676359_n-844x1024.jpg",
          ),
        ],
      ),
    );
  }
}
