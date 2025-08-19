// import 'package:news_app/core/export/export.dart';

// class CustomListViewVertical extends StatelessWidget {
//   const CustomListViewVertical(
//       {super.key,
//       required this.itemCount,
//       this.onTap,
//       required this.date,
//       required this.imageUrl,
//       required this.title,
//       required this.subtitle, required this.height});
//   final int itemCount;
//   final void Function(int)? onTap;
//   final String date;
//   final String imageUrl;
//   final String title;
//   final String subtitle;
//   final double height;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 32.w),
//       height: height,
//       child: ListView.builder(
//         itemCount: itemCount,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap:()=> onTap!(index),
//             child: CustomListTile(
//               date: date,
//               imageUrl: imageUrl,
//               title: title,
//               subtitle: subtitle,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
