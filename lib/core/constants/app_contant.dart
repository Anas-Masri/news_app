import 'package:easy_localization/easy_localization.dart' as easy;

import 'package:news_app/core/export/export.dart';

class AppContant {
  static List<String> categoryList = [
    easy.tr(LocaleKeys.general),
    easy.tr(LocaleKeys.technology),
    easy.tr(LocaleKeys.business),
    easy.tr(LocaleKeys.health),
    easy.tr(LocaleKeys.entertainment),
    easy.tr(LocaleKeys.science),
    easy.tr(LocaleKeys.sport),
  ];
  static List<String> categoryListEn = [
    LocaleKeys.general,
    LocaleKeys.technology,
    LocaleKeys.business,
    LocaleKeys.health,
    LocaleKeys.entertainment,
    LocaleKeys.science,
    LocaleKeys.sport,
  ];

  static const String apiKey = 'bd535f82392f49aab2b1b33305398c23';
}
