import 'package:get/get.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/view/home/view/article_view.dart';
import 'package:news_app/view/home/view/home_view.dart';
import 'package:news_app/view/home/view/search_view.dart';
import 'package:news_app/view/home/view/search_results_view.dart';

class AppRoutes {
  static final List<GetPage> appPages = [
    GetPage(name: Routes.homeView, page: () => const HomeView()),
    GetPage(name: Routes.searchView, page: () => const SearchView()),
    GetPage(
        name: Routes.searchResultView, page: () => const SearchResultsView()),
    GetPage(name: Routes.articleView, page: () => const ArticleView()),
  ];
}
