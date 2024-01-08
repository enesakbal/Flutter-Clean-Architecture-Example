import '../../../models/movie_credit/movie_credit_model.dart';
import '../../../models/movie_listings/movie_listings_model.dart';

/// Abstract class that defines the methods for fetching popular and top rated movies from a remote data source.
abstract class MovieRemoteDataSource {
  /// Fetches a list of popular movies from the remote data source.
  Future<MovieListingsModel> getPopularMovies({required int page});

  /// Fetches a list of top rated movies from the remote data source.
  Future<MovieListingsModel> getTopRatedMovies({required int page});

  /// Retrieves the movie credits for a given movie ID from the remote data source.
  Future<MovieCreditModel> getMovieCredits({required int movieId});
}
