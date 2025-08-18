import 'package:news_app/core/services/app_api.dart';
import '../../../core/export/export.dart';

class HomeController extends GetxController {
  int selectedCategory = 0;
  List<Article> articles = <Article>[];
  Statues statues = Statues.init;
  int articleIndex = 0;
  changeCategory(int index) {
    selectedCategory = index;
    update();
  }

  @override
  void onInit() {
    getAllNews();
    getTopHeadLine();
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
    final response =
        await AppApi.getData(url: AppLinks.everything, queryParameters: {
      'q': '*',
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

        articles = news.articles ?? [];
      },
    );
  }
}
