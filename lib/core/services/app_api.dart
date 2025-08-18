import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';

import 'package:news_app/core/export/export.dart';

class AppApi {
  static Future<Either<StatusRequest, NewsModel>> getData(
      {required String category}) async {
    try {
      var response = await http.get(
        Uri.parse(AppLinks.everything).replace(queryParameters: {
          'q': category,
          'apiKey': AppContant.apiKey,
        }),
      );
      if (response.statusCode == 200) {
        NewsModel responseBody = NewsModel.fromJson(jsonDecode(response.body));

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}

enum StatusRequest {
  loading,
  success,
  failure,
  serverFailure,
  offlineFailure,
  none
}
