import 'package:easy_localization/easy_localization.dart';

import '../../../core/export/export.dart';

class HomeController extends GetxController {
  int selectedCategory = 0;
  List<Article> articles = [];
  List<Article> topHeadLineArticles = [];
  Statues statues = Statues.init;
  TextEditingController searchController = TextEditingController();
  changeCategory(int index) {
    articles = [];
    topHeadLineArticles = [];
    selectedCategory = index;
    getAllNews(AppContant.categoryList[selectedCategory]);
    getTopHeadLine();
    update();
  }

  @override
  void onInit() {
    getAllNews(AppContant.categoryList[selectedCategory]);
    getTopHeadLine();
    super.onInit();
  }

  void changeLanguage(BuildContext context) {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
    update();
  }

  getArticleIndex(int index) {
    update();
    Get.toNamed(Routes.articleView, arguments: articles[index]);
  }

  getArticleTopHeadLineIndex(int index) {
    update();
    Get.toNamed(Routes.articleView, arguments: topHeadLineArticles[index]);
  }

  clearSeach() {
    searchController.clear();
    update();
  }

  search(String searchedText) {
    if (searchedText.length > 4) {
      getAllNews(searchedText);
      update();
    }
  }

  Future<void> getAllNews(String search) async {
    statues = Statues.loading;
    update();
    final response =
        await AppApi.getData(url: AppLinks.everything, queryParameters: {
      'q': search,
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
