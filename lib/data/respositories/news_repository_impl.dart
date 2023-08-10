import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDatasource _newsRemoteDatasource;

  NewsRepositoryImpl(this._newsRemoteDatasource);

  @override
  Future<Either<AppError, List<ArticleEntity>>> getEverythingNews() async {
    try {
      final articles = await _newsRemoteDatasource.getEverythingNews();

      if (articles.isEmpty) {
        return const Left(AppError(AppErrorType.api));
      }
      print(articles);
      return Right(articles);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
