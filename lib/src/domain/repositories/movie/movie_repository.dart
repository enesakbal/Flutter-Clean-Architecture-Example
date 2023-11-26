import 'package:dartz/dartz.dart';

import '../../../core/exceptions/database/database_exception.dart';
import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/export_entities.dart';

abstract class MovieRepository {
  //* Remote Data Source
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page});

  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page});

  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId});

  //* Local Data Source
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSavedMovieDetails();

  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity});

  Future<Either<DatabaseException, void>> deleteMovieDetail({required int? movieId});

  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId});
}
