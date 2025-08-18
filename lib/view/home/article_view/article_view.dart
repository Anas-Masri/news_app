import 'package:news_app/view/home/home_controller/home_controller.dart';

import '../../../core/export/export.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder(
          init: HomeController(),
          builder: (controller) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  child: CachedNetworkImage(
                    imageUrl: controller
                        .articles[controller.articleIndex].urlToImage!,
                    height: 316.h,
                    width: 430.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 270.h,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                Text(
                                    controller.articles[controller.articleIndex]
                                        .title!,
                                    style: AppTextStyle.title18Black),
                                SizedBox(height: 16.h),
                                Text(
                                    '${controller.articles[controller.articleIndex].author ?? ''} . ${controller.articles[controller.articleIndex].publishedAt.toString().substring(0, 10)}',
                                    style: AppTextStyle.subTitle12Greay),
                                SizedBox(height: 24.h),
                                Text(
                                    style: AppTextStyle.subTitle16black
                                        .copyWith(height: 2),
                                    controller.articles[controller.articleIndex]
                                        .description!)
                              ],
                            ),
                          ),
                        )))
              ],
            );
          }),
    );
  }
}
