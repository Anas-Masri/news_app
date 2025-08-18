import 'package:news_app/core/services/app_api.dart';
import '../../../core/export/export.dart';

class HomeController extends GetxController {
  int selectedCategory = 0;
  var articles = <Article>[].obs;
  Statues statues = Statues.init;
  int articleIndex = 0;
  changeCategory(int index) {
    selectedCategory = index;
    update();
  }

  @override
  void onInit() {
    getAllNews();
    super.onInit();
  }

  getArticleIndex(int index) {
    articleIndex = index;
    update();
    Get.toNamed(Routes.articleView);
  }

  Future<void> getAllNews() async {
    statues = Statues.loading;
    update();
    final response = await AppApi.getData(category: '*');
    response.fold(
      (failure) {
        statues = Statues.failure;
        update();
      },
      (news) {
        statues = Statues.success;
        update();

        articles.value = news.articles ?? [];
      },
    );
  }
}
