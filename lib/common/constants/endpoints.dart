import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEnpoints {
  const APIEnpoints._();

  static final String apiKey = dotenv.env['API_KEY'] ?? '';
  static final baseUrl = dotenv.env['BASE_URL'] ?? '';
}
