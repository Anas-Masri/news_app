import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:news_app/core/constants/app_color.dart';
import 'package:news_app/core/constants/app_text_style.dart';
import 'package:news_app/generated/locale_keys.g.dart';
import 'package:news_app/view/home/home_controller/home_controller.dart';

import '../../../core/constants/app_contant.dart';
import '../../../widgets/custom_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: const Icon(
                Icons.search,
              ))
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
                  child: Column(
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
                      Padding(
                        padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                              width: 366.w,
                              height: 206.h,
                              fit: BoxFit.cover,
                              'https://static.euronews.com/articles/stories/04/34/02/50/1440x810_cmsv2_edbb25e9-8017-5fad-be0d-32b56fe7ea79-4340250.jpg'),
                        ),
                      ),
                      Text('Apple Unveils Revolutionary AI Features ',
                          style: AppTextStyle.title18Black),
                      SizedBox(height: 12.h),
                      Text('Abdallah . May 1, 2025 ',
                          style: AppTextStyle.subTitle12Greay),
                      SizedBox(height: 40.h),
                      SizedBox(
                        height: 390.h,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return const CustomListTile(
                                imageUrl:
                                    'https://static.euronews.com/articles/stories/04/34/02/50/1440x810_cmsv2_edbb25e9-8017-5fad-be0d-32b56fe7ea79-4340250.jpg',
                                title:
                                    'Apple Unveils Revolutionary AI Features',
                                subtitle: 'Abdallah . May 1, 2025');
                          },
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
