import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_color.dart';

class AppTextStyle {
  static TextStyle headTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColor.blackColor,
    fontSize: 32.sp,
  );

  static TextStyle title18Black = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColor.blackColor,
    fontSize: 18.sp,
  );
  static TextStyle subTitle14Black = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColor.blackColor,
    fontSize: 14.sp,
  );
  static TextStyle subTitle12Greay = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColor.greayColor,
    fontSize: 12.sp,
  );
  static TextStyle subTitle16black = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColor.blackColor,
    fontSize: 16.sp,
  );
}
