import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/data/respositories/news_repository_impl.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockNewsRemoteDatasource mockNewsRemoteDatasource;
  late NewsRepositoryImpl newsRepositoryImpl;

  setUp(() {
    mockNewsRemoteDatasource = MockNewsRemoteDatasource();
    newsRepositoryImpl = NewsRepositoryImpl(mockNewsRemoteDatasource);
  });

  const testArticleModel = Article(
    author: "Me",
    content: "Hello",
    description: "Hello world",
    source: Source(id: Id.THE_VERGE, name: "The Verge"),
    title: "Hi",
    url: "www.hello.com",
    urlToImage: "www.hello.com/hello",
  );

  const testArticleEntity = ArticleEntity(
    author: "Me",
    content: "Hello",
    description: "Hello world",
    source: Source(id: Id.THE_VERGE, name: "The Verge"),
    title: "Hi",
    url: "www.hello.com",
    urlToImage: "www.hello.com/hello",
  );

  String tCategory = 'technology';

  group('get everyday news', () {
    test('should return news when a call to datasource is successfull',
        () async {
      // arrange
      when(mockNewsRemoteDatasource.getEverythingNews())
          .thenAnswer((_) async => [testArticleModel]);
      // act
      final result = await newsRepositoryImpl.getEverythingNews();

      final list1 = result.getOrElse(() => []);
      final list2 = [testArticleEntity];

      // assert
      expect(list1, equals(list2));
    });

    test('should return connection failure when the device has no internet',
        () async {
      // arrange
      when(mockNewsRemoteDatasource.getEverythingNews()).thenThrow(
          const SocketException('Failed to connect to the newtwork'));
      // act
      final result = await newsRepositoryImpl.getEverythingNews();

      // assert
      expect(result, equals(const Left(AppError(AppErrorType.network))));
    });
  });

  group('get top headlines news', () {
    test('should return news when a call to datasource is successfull',
        () async {
      // arrange
      when(mockNewsRemoteDatasource.getTopHeadlines(tCategory))
          .thenAnswer((_) async => [testArticleModel]);
      // act
      final result = await newsRepositoryImpl.getTopHeadlines(tCategory);

      final list1 = result.getOrElse(() => []);
      final list2 = [testArticleEntity];

      // assert
      expect(list1, equals(list2));
    });

    test('should return connection failure when the device has no internet',
        () async {
      // arrange
      when(mockNewsRemoteDatasource.getTopHeadlines(tCategory)).thenThrow(
          const SocketException('Failed to connect to the newtwork'));
      // act
      final result = await newsRepositoryImpl.getTopHeadlines(tCategory);

      // assert
      expect(result, equals(const Left(AppError(AppErrorType.network))));
    });
  });
}
