import '../core/export/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.date});
  final String title;
  final String subtitle;
  final String date;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  title,
                  style: AppTextStyle.title18Black,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: Text(subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.subTitle12Greay)),
                    Text(date, style: AppTextStyle.subTitle12Greay),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColor.lightgreayColor,
              )),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColor.lightgreayColor,
              ),
              width: 112.w,
              height: 80.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
