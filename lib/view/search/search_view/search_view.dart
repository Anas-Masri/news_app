import 'package:get/get.dart';

import '../../../core/export/export.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColor.blueColor));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 75.h),
        child: GetBuilder(
            init: SearchWidgetController(),
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 48.h,
                    width: MediaQuery.of(context).size.width.w - 90.w,
                    color: AppColor.lightgreayColor,
                    child: TextField(
                      controller: controller.searchController,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          AppTextStyle.title18Black.copyWith(fontSize: 17.sp),
                      decoration: InputDecoration(
                          fillColor: const Color(0xffF0EFF0),
                          filled: true,
                          hintText: "Search",
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
                    child: Text('Cancel',
                        style: AppTextStyle.subTitle14Black.copyWith(
                            color: AppColor.blueColor,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              );
            }),
      ),
    );
  }
}
