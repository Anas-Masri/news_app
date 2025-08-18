import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:news_app/view/home/home_controller/home_controller.dart';

import '../../../core/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.searchView),
                  child: const Icon(Icons.search)))
        ],
        toolbarHeight: 68.h,
        titleSpacing: 32.w,
        backgroundColor: AppColor.lightgreayColor,
        title: Text(
          easy.tr(LocaleKeys.explore),
          style: AppTextStyle.headTitle,
        ),
      ),
      body: SingleChildScrollView(
          child: GetBuilder(
              init: HomeController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Builder(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: SizedBox(
                            height: 32.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.w),
                              scrollDirection: Axis.horizontal,
                              itemCount: AppContant.textTitle.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () => controller.changeCategory(index),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.lightgreayColor),
                                        color:
                                            controller.selectedCategory == index
                                                ? AppColor.lightgreayColor
                                                : AppColor.transparentColor,
                                        borderRadius:
                                            BorderRadius.circular(56.r)),
                                    child: Text(
                                      AppContant.textTitle[index],
                                      style: AppTextStyle.subTitle14Black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        switch (controller.statues) {
                          Statues.loading => Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        2.5),
                                const Center(
                                    child: CircularProgressIndicator(
                                        color: AppColor.greayColor))
                              ],
                            ),
                          Statues.init =>
                            const Center(child: CircularProgressIndicator()),
                          Statues.failure =>
                            const Center(child: Text('failure try again')),
                          Statues.success => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 24.h, bottom: 16.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          const Center(
                                              child: CircularProgressIndicator(
                                        color: AppColor.lightgreayColor,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: AppColor.lightgreayColor,
                                      ),
                                      imageUrl:
                                          controller.articles[0].urlToImage ??
                                              '',
                                      width: 366.w,
                                      height: 206.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    controller.articles[0].title ?? '',
                                    style: AppTextStyle.title18Black),
                                SizedBox(height: 12.h),
                                Text(
                                    '${controller.articles[0].author ?? ''} . ${controller.articles[0].publishedAt.toString().substring(0, 10)}',
                                    style: AppTextStyle.subTitle12Greay
                                        .copyWith(fontSize: 14.sp)),
                                SizedBox(height: 24.h),
                                SizedBox(
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
                  }),
                );
              })),
    );
  }
}
