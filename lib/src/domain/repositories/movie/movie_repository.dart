import 'package:dartz/dartz.dart';

import '../../../core/network/network_exception.dart';
import '../../entities/movie_listings/movie_listings_entity.dart';

abstract class MovieRepository {
  Future<Either<NetworkExceptions, MovieListingsEntity>> getTopRatedMovies(
      {required int page});

  Future<Either<NetworkExceptions, MovieListingsEntity>> getPopularMovies(
      {required int page});
}
