import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class GetTopHeadlinesUsecase {
  final NewsRepository _newsRepository;

  GetTopHeadlinesUsecase(this._newsRepository);

  Future<Either<AppError, List<ArticleEntity>>> call(String category) async {
    return _newsRepository.getTopHeadlines(category);
  }
}
