import 'package:news_app/data/api_client.dart';
import 'package:news_app/data/models/news_response_model.dart';

abstract class NewsRemoteDatasource {
  Future<List<Article>> getEverythingNews();
}

class NewsRemoteDatasourceImpl extends NewsRemoteDatasource {
  final ApiClient _client;

  NewsRemoteDatasourceImpl(this._client);

  @override
  Future<List<Article>> getEverythingNews() async {
    final response = await _client.get('everything');
    NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(response);

    return newsResponseModel.articles ?? [];
  }
}
