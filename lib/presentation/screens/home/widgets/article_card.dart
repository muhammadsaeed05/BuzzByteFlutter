import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/constants/routes.dart';

import '../../../../domain/entities/article_entity.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article.urlToImage ?? '',
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.detailScreen,
              arguments: {'article': article}),
          child: Container(
            margin: EdgeInsets.only(
              right: 8.w,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.colorBurn)),
            ),
            width: 300.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  article.title ?? '',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
        margin: EdgeInsets.only(
          right: 8.w,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.4)),
        width: 300.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              article.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
