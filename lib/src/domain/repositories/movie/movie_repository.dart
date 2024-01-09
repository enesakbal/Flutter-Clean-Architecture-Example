import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/database/database_exception.dart';
import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/export_entities.dart';

abstract class MovieRepository {
  //* Remote Data Source
  /// Retrieves the top rated movies from the server.
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page});

  /// Retrieves the popular movies from the server.
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page});

  /// Retrieves the credits for a specific movie from the server.
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId});

  //* Local Data Source
  /// Retrieves the saved movie details from the database.
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSavedMovieDetails();

  /// Saves the movie details to the database.
  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity});

  /// Deletes the movie detail from the database.
  Future<Either<DatabaseException, void>> deleteMovieDetail({required int? movieId});

  /// Checks if the movie detail is saved in the database.
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId});
}
