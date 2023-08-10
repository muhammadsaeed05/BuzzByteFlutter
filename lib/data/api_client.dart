import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/common/constants/endpoints.dart';

class ApiClient {
  final Dio _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    print(getPath(path, params));
    final response = await _client.get(getPath(path, params));

    if (response.statusCode == 200) {
      return response.data;
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${APIEnpoints.baseUrl}$path?q=bitcoin&apiKey=${APIEnpoints.apiKey}$paramsString';
  }
}
