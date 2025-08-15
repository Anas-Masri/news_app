import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(),
      appBar: AppBar(
        title: Text('explore'.tr()),
      ),
    );
  }
}
