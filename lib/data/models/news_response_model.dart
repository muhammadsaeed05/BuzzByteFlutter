import 'dart:convert';

import 'package:news_app/domain/entities/article_entity.dart';

NewsResponseModel newsResponseModelFromJson(Map<String, dynamic> json) =>
    NewsResponseModel.fromJson(json);

String newsResponseModelToJson(NewsResponseModel data) =>
    json.encode(data.toJson());

class NewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article extends ArticleEntity {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          author: author,
          content: content,
          description: description,
          publishedAt: publishedAt,
          source: source,
          title: title,
          url: url,
          urlToImage: urlToImage,
        );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  final Id? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"] ?? ''],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
      };
}

enum Id {
  ARS_TECHNICA,
  BBC_NEWS,
  BUSINESS_INSIDER,
  GOOGLE_NEWS,
  POLITICO,
  THE_VERGE
}

final idValues = EnumValues({
  "ars-technica": Id.ARS_TECHNICA,
  "bbc-news": Id.BBC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "google-news": Id.GOOGLE_NEWS,
  "politico": Id.POLITICO,
  "the-verge": Id.THE_VERGE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
