import 'dart:developer';

import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/core/networking/api_endpoints.dart';
import 'package:news_app_api/core/networking/dio_helper.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';

class SearchResultServices {
  searchByName({required String query}) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.searchEndpoint,
        query: {"apiKey": AppConstants.newsApiKey, "q": query},
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
