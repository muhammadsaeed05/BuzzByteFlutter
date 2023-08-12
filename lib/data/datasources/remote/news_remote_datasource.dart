import 'package:news_app/data/api_client.dart';
import 'package:news_app/data/models/news_response_model.dart';

abstract class NewsRemoteDatasource {
  Future<List<Article>> getEverythingNews();
  Future<List<Article>> getTopHeadlines(String category);
}

class NewsRemoteDatasourceImpl extends NewsRemoteDatasource {
  final ApiClient _client;

  NewsRemoteDatasourceImpl(this._client);

  @override
  Future<List<Article>> getEverythingNews() async {
    Map<String, String> query = {'q': 'tech'};

    final response = await _client.get('everything', params: query);
    NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(response);

    return newsResponseModel.articles ?? [];
  }

  @override
  Future<List<Article>> getTopHeadlines(String category) async {
    Map<String, String> params = {'category': category, 'country': 'us'};

    final response = await _client.get('top-headlines', params: params);
    NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(response);

    return newsResponseModel.articles ?? [];
  }
}
