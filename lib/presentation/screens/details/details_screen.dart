import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/entities/article_entity.dart';

import '../../widgets/webview_container.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleEntity article;

  const DetailsScreen({super.key, required this.article});

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        TextButton.icon(
          icon: const Icon(Icons.share_sharp),
          label: const Text('Read full article here'),
          onPressed: article.url != null
              ? () => _handleURLButtonPress(context, article.url!)
              : null,
        )
      ],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: article.url != null
                  ? () => _handleURLButtonPress(context, article.url!)
                  : null,
              icon: Icon(Icons.share_sharp))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl: article.urlToImage ?? ''),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                article.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(article.author ?? 'Not Specified',
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const Text(' • '),
                  Text(
                    '${article.publishedAt?.day}-${article.publishedAt?.month}-${article.publishedAt?.year}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                article.content ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
