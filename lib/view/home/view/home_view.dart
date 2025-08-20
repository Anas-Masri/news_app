import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_app/widgets/custom_horesintal_crousel_list_item.dart';

import '../../../core/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () => controller.changeLanguage(context),
              child: const Icon(Icons.translate_sharp)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.searchView),
                  child: const Icon(Icons.search)))
        ],
        toolbarHeight: 68.h,
        titleSpacing: 32.w,
        backgroundColor: AppColor.lightgreayColor,
        title: Text(
          LocaleKeys.explore.tr(),
          style: AppTextStyle.headTitle,
        ),
      ),
      body: SingleChildScrollView(
          child: GetBuilder(
              init: HomeController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                      child: SizedBox(
                        height: 32.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: AppContant.categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => controller.changeCategory(index),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.lightgreayColor),
                                    color: controller.selectedCategory == index
                                        ? AppColor.lightgreayColor
                                        : AppColor.transparentColor,
                                    borderRadius: BorderRadius.circular(56.r)),
                                child: Text(
                                  AppContant.categoryList[index].tr(),
                                  style: AppTextStyle.subTitle14Black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    switch (controller.statues) {
                      Statues.loading =>
                        const CustomCenterCircularProgressIndicator(),
                      Statues.init =>
                        const CustomCenterCircularProgressIndicator(),
                      Statues.failure => Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5),
                            const Center(
                                child: Center(child: Text('failure try again')))
                          ],
                        ),
                      Statues.success => controller.topHeadLineArticles.isEmpty
                          ? const CustomCenterCircularProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: CarouselSlider(
                                      items: [
                                        for (int index = 0;
                                            index <
                                                controller
                                                    .topHeadLineArticles.length;
                                            index++)
                                          GestureDetector(
                                            onTap: () => controller
                                                .getArticleTopHeadLineIndex(
                                                    index),
                                            child: CustomHoresintalCrouselListItem(
                                                imageUrl: controller
                                                        .topHeadLineArticles[
                                                            index]
                                                        .urlToImage ??
                                                    '',
                                                title: controller
                                                        .topHeadLineArticles[
                                                            index]
                                                        .title ??
                                                    '',
                                                author: controller
                                                        .topHeadLineArticles[
                                                            index]
                                                        .author ??
                                                    '',
                                                publishedAt: controller
                                                    .topHeadLineArticles[index]
                                                    .publishedAt
                                                    .toString()
                                                    .substring(0, 10)),
                                          )
                                      ],
                                      options: CarouselOptions(
                                        disableCenter: true,
                                        height: 330.h,
                                        aspectRatio: 3,
                                        viewportFraction: 0.8,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(seconds: 1),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.3,
                                        // onPageChanged: callbackFunction,
                                        scrollDirection: Axis.horizontal,
                                      )),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.w),
                                  height: 390.h,
                                  child: ListView.builder(
                                    itemCount: controller.articles.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            controller.getArticleIndex(index),
                                        child: CustomListTile(
                                          date: controller
                                              .articles[index].publishedAt
                                              .toString()
                                              .substring(0, 10),
                                          imageUrl: controller
                                                  .articles[index].urlToImage ??
                                              '',
                                          title: controller
                                                  .articles[index].title ??
                                              '',
                                          subtitle: controller
                                                  .articles[index].author ??
                                              '',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                    },
                  ],
                );
              })),
    );
  }
}
