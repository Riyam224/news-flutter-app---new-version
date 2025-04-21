import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_api/core/widgets/spacing_widgets.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';
import 'package:news_app_api/features/home_screen_service/widgets/article_card_widget.dart';

import 'services/search_result_services.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 120,
        centerTitle: true,
        title: Text("explore".tr()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xff231F20)),
          ),
        ],
      ),
      body: FutureBuilder(
        future: SearchResultServices().searchByName(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            TopHeadLinesModel topHeadLinesModel =
                snapshot.data! as TopHeadLinesModel;
            if (topHeadLinesModel.totalResults == 0) {
              return Center(child: Text("no_results".tr()));
            }
            return Column(
              children: [
                const HeightSpace(16),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadLinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadLinesModel.articles![index];
                        return ArticleCardWidget(
                          title: article.title ?? "",
                          authorName: article.author ?? "",
                          date: DateFormat(
                            'yyyy-MM-dd – kk:mm',
                          ).format(article.publishedAt!),
                          imageUrl: article.urlToImage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
