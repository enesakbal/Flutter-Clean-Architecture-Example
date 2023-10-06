import '../../../../core/constants/url_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../_models/movie_listings/movie_listings_model.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient _dioClient;

  const MovieRemoteDataSourceImpl(this._dioClient);

  /// Retrieves a list of popular movies from the remote data source.
  @override
  Future<MovieListingsModel> getPopularMovies({required int page}) async {
    try {
      final response = await _dioClient.get(UrlConstants.popularMovies, queryParameters: {'page': page});

      final model = MovieListingsModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  /// Retrieves a list of top rated movies from the remote data source.
  @override
  Future<MovieListingsModel> getTopRatedMovies({required int page}) async {
    try {
      final response = await _dioClient.get(UrlConstants.topRatedMovies, queryParameters: {'page': page});

      final model = MovieListingsModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }
}
