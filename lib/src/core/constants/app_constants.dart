import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final baseUrl = '${dotenv.env['BASE_URL']}'; //* https://api.themoviedb.org/3
  static final apiToken = '${dotenv.env['API_TOKEN']}'; //* your TMDB token
}
