import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_api/core/routing/app_routes.dart';
import 'package:news_app_api/core/styles/app_text_styles.dart';
import 'package:news_app_api/core/widgets/spacing_widgets.dart';
import 'package:news_app_api/features/home_screen_service/models/top_headlines_model.dart';

class ArticleCardWidget extends StatelessWidget {
  final TopHeadLinesModel article;
  const ArticleCardWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.articleDetailsScreen,
          arguments: article,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Text(
                    article.title ?? 'No title available',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titlesStyles.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                const HeightSpace(8),
                SizedBox(
                  width: 238.w,
                  child: Text(
                    "${article.author ?? 'Unknown'} • ${article.publishedAt ?? ''}",
                    style: AppTextStyles.grey14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      "https://static.toiimg.com/photo/msid-109960309/109960309.jpg",
                  height: 80.h,
                  width: 112.w,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
