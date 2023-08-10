import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class GetEverythingUseCase {
  final NewsRepository _newsRepository;

  GetEverythingUseCase(this._newsRepository);

  Future<Either<AppError, List<ArticleEntity>>> call() async {
    return _newsRepository.getEverythingNews();
  }
}
