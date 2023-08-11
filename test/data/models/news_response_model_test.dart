import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  Article testArticleModel = Article(
    author: "Me",
    content: "Hello",
    description: "Hello world",
    // publishedAt: DateTime.now(),
    source: Source(id: Id.THE_VERGE, name: "The Verge"),
    title: "Hello",
    url: "www.hello.com",
    // urlToImage: "www.hello.com",
  );

  NewsResponseModel testNewsResponseModel = NewsResponseModel(
      status: "ok", totalResults: 9238, articles: [testArticleModel]);

  test('should be a subclass of articles entity', () async {
    //assert
    expect(testArticleModel, isA<ArticleEntity>());
  });

  test('should return a valid model from json', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_data.json'));

    // act
    var articleResponse = NewsResponseModel.fromJson(jsonMap);

    // asesert
    expect(articleResponse, testNewsResponseModel);
  });

  test('should return a json map containing proper data', () async {
    // arrange

    // act
    final result = testNewsResponseModel.toJson();

    final expectedJsonMap = {
      "status": "ok",
      "totalResults": 9238,
      "articles": [
        {
          "source": {"id": "the-verge", "name": "The Verge"},
          "author": "Me",
          "title": "Hello",
          "description": "Hello world",
          "url": "www.hello.com",
          "content": "Hello",
          'urlToImage': null,
          'publishedAt': null,
        }
      ]
    };

    // asesert
    expect(result, expectedJsonMap);
  });
}
