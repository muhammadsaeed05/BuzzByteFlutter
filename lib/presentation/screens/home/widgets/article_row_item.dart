import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/constants/routes.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class ArticleRowItem extends StatelessWidget {
  const ArticleRowItem({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.detailScreen,
          arguments: {'article': article}),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => Container(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  errorWidget: (context, url, error) => Placeholder(),
                  height: 75.h,
                  width: 75.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.clip,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            article.author ?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${article.publishedAt?.year}-${article.publishedAt?.month}-${article.publishedAt?.day}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
