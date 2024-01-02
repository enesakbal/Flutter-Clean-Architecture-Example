import '../_collections/movie_detail/movie_detail_collection.dart';

abstract class MovieLocalDataSource {
  const MovieLocalDataSource();

  /// Saves the [movieDetailCollection] to the local data source.
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection});

  /// Deletes the movie detail with the given [movieId] from the local data source.
  Future<void> deleteMovieDetail({required int? movieId});

  /// Returns a boolean indicating whether the movie detail with the given [movieId] is saved in the local data source.
  Future<bool> isSavedMovieDetail({required int? movieId});

  /// Returns a list of all saved movie details from the local data source.
  Future<List<MovieDetailCollection>> getSavedMovieDetails();
}
