import '../core/export/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl});
  final String title;
  final String subtitle;
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
                  title,
                  style: AppTextStyle.title18Black,
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: AppTextStyle.subTitle12Greay,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              imageUrl,
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
