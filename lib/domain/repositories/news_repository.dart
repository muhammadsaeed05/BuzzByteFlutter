import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';

abstract class NewsRepository {
  Future<Either<AppError, List<ArticleEntity>>> getEverythingNews();
}
