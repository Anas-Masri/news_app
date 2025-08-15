import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/view/home/home_view/home_view.dart';

class AppRoutes {
  static final List<GetPage> appPages = [
    GetPage(name: Routes.homeView, page: () => const HomeView()),
    GetPage(name: Routes.searchView, page: () => Container()),
    GetPage(name: Routes.searchResultView, page: () => Container()),
  ];
}
