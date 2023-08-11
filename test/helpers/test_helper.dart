import 'package:dio/dio.dart' as dio;
import 'package:mockito/annotations.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';

import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/domain/usecases/get_everything_news.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemoteDatasource,
  GetEverythingUseCase
], customMocks: [
  MockSpec<dio.Dio>(as: #MockDioClient),
])
void main() {}
