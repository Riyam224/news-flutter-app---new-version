import 'package:flutter/material.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.article});

  final TopHeadLinesModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
      ),
    );
  }
}
