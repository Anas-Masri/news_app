import 'package:get/get.dart';
import 'package:news_app/core/export/export.dart';

class SearchWidgetController extends GetxController {
  TextEditingController searchController = TextEditingController();
  clearSeach() {
    searchController.clear();
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
