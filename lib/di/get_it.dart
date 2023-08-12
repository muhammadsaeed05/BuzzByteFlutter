import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/api_client.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';
import 'package:news_app/data/respositories/news_repository_impl.dart';
import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/domain/usecases/get_everything_news.dart';
import 'package:news_app/domain/usecases/get_top_headlines.dart';
import 'package:news_app/presentation/blocs/headlines_news/headlines_news_bloc.dart';
import 'package:news_app/presentation/blocs/news/news_bloc.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetEverythingUseCase>(
      () => GetEverythingUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetTopHeadlinesUsecase>(
      () => GetTopHeadlinesUsecase(getItInstance()));

  getItInstance.registerFactory<NewsBloc>(() => NewsBloc(getItInstance()));

  getItInstance.registerFactory<HeadlinesNewsBloc>(
      () => HeadlinesNewsBloc(getItInstance()));
}
