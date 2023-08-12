import 'package:dio/dio.dart';
import 'package:news_app/common/constants/endpoints.dart';

class ApiClient {
  final Dio _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(getPath(path, params));
    print(getPath(path, params));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiEndpoints.baseUrl}$path?apiKey=${ApiEndpoints.apiKey}$paramsString';
  }
}
