import '../_models/movie_listings_model/movie_listings_model.dart';

/// Abstract class that defines the methods for fetching popular and top rated movies from a remote data source.
abstract class MovieRemoteDataSource {
  /// Fetches a list of popular movies from the remote data source.
  Future<MovieListingsModel> getPopularMovies({required int page});

  /// Fetches a list of top rated movies from the remote data source.
  Future<MovieListingsModel> getTopRatedMovies({required int page});
}
