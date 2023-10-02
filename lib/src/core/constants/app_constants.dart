import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  final baseUrl = '${dotenv.env['BASE_URL']}'; //* https://api.themoviedb.org/3
  final apiToken = '${dotenv.env['API_TOKEN']}'; //* your TMDB token
}
