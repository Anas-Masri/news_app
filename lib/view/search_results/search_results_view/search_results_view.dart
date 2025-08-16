import 'package:news_app/core/export/export.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search results',
          style: AppTextStyle.title18Black,
        ),
        backgroundColor: AppColor.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const CustomListTile(
                title: 'Apple Unveils Revolutionary AI Features ',
                subtitle: ' subtitle May 3, 2023',
                imageUrl:
                    'https://static.euronews.com/articles/stories/04/34/02/50/1440x810_cmsv2_edbb25e9-8017-5fad-be0d-32b56fe7ea79-4340250.jpg');
          },
        ),
      ),
      backgroundColor: AppColor.whiteColor,
    );
  }
}
