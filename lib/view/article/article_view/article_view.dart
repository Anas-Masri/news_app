import '../../../core/export/export.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
                height: 316.h,
                width: 430.w,
                fit: BoxFit.fill,
                'https://static.euronews.com/articles/stories/04/34/02/50/1440x810_cmsv2_edbb25e9-8017-5fad-be0d-32b56fe7ea79-4340250.jpg'),
          ),
          Positioned(
              top: 270.h,
              child: Container(
                  width: double.infinity,
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
                          Text('Apple Unveils Revolutionary AI Features ',
                              style: AppTextStyle.title18Black),
                          SizedBox(height: 16.h),
                          Text('Abdallah Yassein · Apr 12, 2023 ',
                              style: AppTextStyle.subTitle12Greay),
                          SizedBox(height: 24.h),
                          Text(
                              style: AppTextStyle.subTitle16black
                                  .copyWith(height: 2),
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Mauris ante ligula, facilisis sed ornare eu, lobortis in odio. Praesent convallis urna a lacus interdum ut hendrerit risus congue. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta.')
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
