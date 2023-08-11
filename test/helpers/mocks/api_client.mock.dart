import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/api_client.dart';

class MockApiClient extends Mock implements ApiClient {
  final Dio dio;

  MockApiClient(this.dio);
}

class DioAdapterMock extends Mock implements HttpClientAdapter {}
