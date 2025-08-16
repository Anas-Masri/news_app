import 'package:get/get.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/view/article/article_view/article_view.dart';
import 'package:news_app/view/home/home_view/home_view.dart';
import 'package:news_app/view/search/search_view/search_view.dart';
import 'package:news_app/view/search_results/search_results_view/search_results_view.dart';

class AppRoutes {
  static final List<GetPage> appPages = [
    GetPage(name: Routes.homeView, page: () => const HomeView()),
    GetPage(name: Routes.searchView, page: () => const SearchView()),
    GetPage(
        name: Routes.searchResultView, page: () => const SearchResultsView()),
    GetPage(name: Routes.articleView, page: () => const ArticleView()),
  ];
}
