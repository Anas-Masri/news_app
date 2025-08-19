import 'package:news_app/core/export/export.dart';

class CustomHoresintalCrouselListItem extends StatelessWidget {
  const CustomHoresintalCrouselListItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.publishedAt});
  final String imageUrl;
  final String title;
  final String author;
  final String publishedAt;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColor.lightgreayColor,
              )),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColor.lightgreayColor,
              ),
              imageUrl: imageUrl,
              width: 366.w,
              height: 206.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 366.w,
          child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              title,
              style: AppTextStyle.title18Black),
        ),
        SizedBox(height: 12.h),
        Text('$author . $publishedAt',
            style: AppTextStyle.subTitle12Greay.copyWith(fontSize: 14.sp)),
      ],
    );
  }
}
