import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/get_top_headlines.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopHeadlinesUsecase getTopHeadlinesUsecase;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    getTopHeadlinesUsecase = GetTopHeadlinesUsecase(mockNewsRepository);
  });

  var testArticlesEntity = [
    ArticleEntity(
        author: "Me",
        content: "Hello",
        description: "Hello world",
        publishedAt: DateTime.now(),
        source: const Source(id: Id.GOOGLE_NEWS, name: "Google News"),
        title: "Hello",
        url: "www.hello.com",
        urlToImage: "www.hello.com")
  ];

  String tCategory = 'technology';

  test(
    'should get top headlines news from the repository',
    () async {
      // arrange
      when(mockNewsRepository.getTopHeadlines(tCategory))
          .thenAnswer((realInvocation) async => Right(testArticlesEntity));

      // act
      final result = await getTopHeadlinesUsecase(tCategory);

      // assert
      expect(result, Right(testArticlesEntity));
    },
  );
}
