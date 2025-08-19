import 'package:easy_localization/easy_localization.dart' as easy;

import '../../../core/export/export.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColor.blueColor));
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(top: 75.h),
        child: GetBuilder(
            init: HomeController(),
            builder: (controller) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 48.h,
                        width: MediaQuery.of(context).size.width.w - 90.w,
                        color: AppColor.lightgreayColor,
                        child: TextField(
                          onChanged: (value) => controller.search(value),
                          onSubmitted: (value) => Get.toNamed(
                              Routes.searchResultView,
                              arguments: value),
                          scrollPadding: const EdgeInsets.all(0),
                          controller: controller.searchController,
                          textAlignVertical: TextAlignVertical.center,
                          style: AppTextStyle.title18Black
                              .copyWith(fontSize: 17.sp),
                          decoration: InputDecoration(
                              isDense: true,
                              fillColor: const Color(0xffF0EFF0),
                              filled: true,
                              hintText: easy.tr(LocaleKeys.search),
                              suffixIcon: GestureDetector(
                                onTap: () => controller.clearSeach(),
                                child: const Icon(Icons.cancel_rounded,
                                    color: Color(0xffCCCCCC)),
                              ),
                              prefixIcon: const Icon(Icons.search,
                                  color: Color(0xff8A8184)),
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(easy.tr(LocaleKeys.cancel),
                            style: AppTextStyle.subTitle14Black.copyWith(
                                color: AppColor.blueColor,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  controller.searchController.text.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5),
                            Center(
                                child: Text(
                                    easy.tr(LocaleKeys.typeAnythingToSearch))),
                          ],
                        )
                      : controller.articles.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        2.5),
                                Center(
                                    child:
                                        Text(easy.tr(LocaleKeys.nothingFound))),
                              ],
                            )
                          : Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 16.h, right: 32.w, left: 32.w),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
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
                                        title:
                                            controller.articles[index].title ??
                                                '',
                                        subtitle:
                                            controller.articles[index].author ??
                                                '',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                ],
              );
            }),
      ),
    );
  }
}
