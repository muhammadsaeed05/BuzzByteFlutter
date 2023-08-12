import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:news_app/common/constants/endpoints.dart';

import 'package:news_app/data/api_client.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';
import 'package:news_app/data/models/news_response_model.dart';

import '../../../helpers/json_reader.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late ApiClient apiClient;
  late NewsRemoteDatasourceImpl newsRemoteDatasourceImpl;

  setUp(() async {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = dioAdapter;
    apiClient = ApiClient(dio);
    newsRemoteDatasourceImpl = NewsRemoteDatasourceImpl(apiClient);
    await dotenv.load(fileName: '.env');
  });

  group('get everyting news', () {
    test('should return article model when the response code is 200', () async {
      // arrange
      dioAdapter.onGet(
          'https://newsapi.org/v2/everything?apiKey=c4e613930f9f43578688199b36ed270d&q=tech',
          (server) {
        server.reply(
            200, jsonDecode(readJson('helpers/dummy_data/dummy_data.json')));
      }, data: Matchers.any, queryParameters: {}, headers: {});

      // act
      final result = await newsRemoteDatasourceImpl.getEverythingNews();

      expect(result, isA<List<Article>>());
    });
  });

  group('get top headlines news', () {
    test('should return article model when the response code is 200', () async {
      // arrange
      dioAdapter.onGet(
          '${ApiEndpoints.baseUrl}top-headlines?apiKey=${ApiEndpoints.apiKey}&category=technology',
          (server) {
        server.reply(
            200, jsonDecode(readJson('helpers/dummy_data/dummy_data.json')));
      }, data: Matchers.any, queryParameters: {}, headers: {});

      // act
      final result =
          await newsRemoteDatasourceImpl.getTopHeadlines('technology');

      expect(result, isA<List<Article>>());
    });
  });
}
