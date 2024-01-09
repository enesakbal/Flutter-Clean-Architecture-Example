import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/database/database_exception.dart';
import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/export_entities.dart';
import '../../repositories/movie/movie_repository.dart';

class MovieUsecases {
  final MovieRepository _movieRepository;

  const MovieUsecases(this._movieRepository);

  //* REMOTE
  /// This method gets popular movies from the remote data source.
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page}) async {
    return _movieRepository.getPopularMovies(page: page);
  }

  /// This method gets top rated movies from the remote data source.
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page}) async {
    return _movieRepository.getTopRatedMovies(page: page);
  }

  /// Retrieves the movie credits for a given movie ID.
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId}) async {
    return _movieRepository.getMovieCredits(movieId: movieId);
  }

  //* LOCAL
  /// This method gets saved movie details from the local data source.
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSavedMovieDetails() async {
    return _movieRepository.getSavedMovieDetails();
  }

  /// This method toggles bookmark for a movie in the local data source.
  Future<Either<DatabaseException, void>> toggleBookmark({required MovieDetailEntity? movieDetailEntity}) async {
    final isSaved = await _movieRepository.isSavedMovieDetail(movieId: movieDetailEntity?.id);

    return isSaved.fold(
      (error) {
        return Left(error);
      },
      (isSaved) {
        if (isSaved) {
          return _movieRepository.deleteMovieDetail(movieId: movieDetailEntity?.id);
        } else {
          return _movieRepository.saveMovieDetails(movieDetailEntity: movieDetailEntity);
        }
      },
    );
  }
}
