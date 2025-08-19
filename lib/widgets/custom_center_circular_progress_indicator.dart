import 'package:news_app/core/export/export.dart';

class CustomCenterCircularProgressIndicator extends StatelessWidget {
  const CustomCenterCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 2.5),
        const Center(
            child: CircularProgressIndicator(color: AppColor.greayColor))
      ],
    );
  }
}
