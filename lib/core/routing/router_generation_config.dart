import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_api/core/routing/app_routes.dart';
import 'package:news_app_api/features/home_screen_service/home_screen.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';
import 'package:news_app_api/features/home_screen_service/news_details_screen.dart';
import 'package:news_app_api/features/search_screen_service/search_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) {
          final query = state.extra as String;
          return SearchScreen(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.articleDetailsScreen,
        name: AppRoutes.articleDetailsScreen,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.articleDetailsScreen,
        name: AppRoutes.articleDetailsScreen,
        builder: (context, state) {
          TopHeadLinesModel article = state.extra as TopHeadLinesModel;
          return NewsDetailsScreen(article: article);
        },
      ),
    ],
  );
}
