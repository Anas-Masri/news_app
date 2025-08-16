import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedCategory = 0;
  changeCategory(int index) {
    selectedCategory = index;
    update();
  }
}
