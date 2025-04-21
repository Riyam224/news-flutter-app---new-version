import 'dart:developer';

import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/core/networking/api_endpoints.dart';
import 'package:news_app_api/core/networking/dio_helper.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';

class HomeScreenServices {
  getTopHeadlineArticle() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlinesEndpoint,
        query: {
          "apiKey": AppConstants.newsApiKey,
          "country": "us",
          "language": AppConstants.lang,
        },
      );

      if (response.statusCode == 200) {
        TopHeadLinesModel topHeadLinesModel = TopHeadLinesModel.fromJson(
          response.data,
        );
        log(topHeadLinesModel.totalResults.toString());
        return topHeadLinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
