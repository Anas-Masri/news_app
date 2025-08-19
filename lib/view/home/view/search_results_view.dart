// import 'package:news_app/core/export/export.dart';

// class SearchResultsView extends StatelessWidget {
//   const SearchResultsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Search results',
//           style: AppTextStyle.title18Black,
//         ),
//         backgroundColor: AppColor.whiteColor,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
//         child: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return const CustomListTile(
//                 date: '',
//                 title: 'Apple Unveils Revolutionary AI Features ',
//                 subtitle: ' subtitle May 3, 2023',
//                 imageUrl:
//                     'https://static.euronews.com/articles/stories/04/34/02/50/1440x810_cmsv2_edbb25e9-8017-5fad-be0d-32b56fe7ea79-4340250.jpg');
//           },
//         ),
//       ),
//       backgroundColor: AppColor.whiteColor,
//     );
//   }
// }
import '../../../core/export/export.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 25.w),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.blueColor,
                        ),
                      )
                    ],
                  ),
                  controller.searchController.text.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5),
                            const Center(
                                child: Text('Type anything to search')),
                          ],
                        )
                      : controller.articles.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        2.5),
                                const Center(child: Text('nothing found')),
                              ],
                            )
                          : Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 32.w),
                                child: ListView.builder(
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
