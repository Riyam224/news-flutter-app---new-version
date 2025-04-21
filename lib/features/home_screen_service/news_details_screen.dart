import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_api/core/styles/app_text_styles.dart';
import 'package:news_app_api/core/widgets/spacing_widgets.dart';
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
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 300.h,
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://static.toiimg.com/photo/msid-109960309/109960309.jpg",

                fit: BoxFit.fill,
                placeholder:
                    (context, url) => const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
              ),
            ),
            Positioned(
              top: 300.h,

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        article.title ?? 'No title available',
                        style: AppTextStyles.titlesStyles.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      const HeightSpace(8),
                      Text(
                        "${article.author ?? 'Unknown'} • ${article.publishedAt ?? ''}",
                        style: AppTextStyles.grey14Regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const HeightSpace(16),
                      Text(
                        article.description ?? 'No description available',
                        style: AppTextStyles.grey14Regular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
