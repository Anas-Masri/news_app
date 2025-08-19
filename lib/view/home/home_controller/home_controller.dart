import 'package:news_app/core/services/app_api.dart';
import '../../../core/export/export.dart';

class HomeController extends GetxController {
  int selectedCategory = 0;
  List<Article> articles = [];
  List<Article> topHeadLineArticles = [];
  Statues statues = Statues.init;

  changeCategory(int index) {
    articles = [];
    topHeadLineArticles = [];
    selectedCategory = index;
    getAllNews();
    getTopHeadLine();
    update();
  }

  @override
  void onInit() {
    getAllNews();
    getTopHeadLine();
    super.onInit();
  }

  getArticleIndex(int index) {
    update();
    Get.toNamed(Routes.articleView, arguments: articles[index]);
  }

  getArticleTopHeadLineIndex(int index) {
    update();
    Get.toNamed(Routes.articleView, arguments: topHeadLineArticles[index]);
  }

  Future<void> getAllNews() async {
    statues = Statues.loading;
    update();
    final response =
        await AppApi.getData(url: AppLinks.everything, queryParameters: {
      'q': AppContant.categoryList[selectedCategory],
      'apiKey': AppContant.apiKey,
    });
    response.fold(
      (failure) {
        statues = Statues.failure;
        update();
      },
      (news) {
        statues = Statues.success;
        update();

        articles = news.articles ?? [];
      },
    );
  }

  Future<void> getTopHeadLine() async {
    statues = Statues.loading;
    update();
    final response =
        await AppApi.getData(url: AppLinks.topHeadlines, queryParameters: {
      'category': AppContant.categoryList[selectedCategory],
      'apiKey': AppContant.apiKey,
    });
    response.fold(
      (failure) {
        statues = Statues.failure;
        update();
      },
      (news) {
        statues = Statues.success;
        update();

        topHeadLineArticles = news.articles ?? [];
      },
    );
  }
}
