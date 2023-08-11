import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/get_everything_news.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetEverythingUseCase getEverythingUseCase;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    getEverythingUseCase = GetEverythingUseCase(mockNewsRepository);
  });

  var testArticlesEntity = [
    ArticleEntity(
        author: "Me",
        content: "Hello",
        description: "Hello world",
        publishedAt: DateTime.now(),
        source: Source(id: Id.GOOGLE_NEWS, name: "Google News"),
        title: "Hello",
        url: "www.hello.com",
        urlToImage: "www.hello.com")
  ];

  test(
    'should get everything news from the repository',
    () async {
      // arrange
      when(mockNewsRepository.getEverythingNews())
          .thenAnswer((realInvocation) async => Right(testArticlesEntity));

      // act
      final result = await getEverythingUseCase();

      // assert
      expect(result, Right(testArticlesEntity));
    },
  );
}
