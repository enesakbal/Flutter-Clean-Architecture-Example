import 'package:dartz/dartz.dart';

import '../../../core/network/network_exception.dart';
import '../../entities/movie_listings/movie_listings_entity.dart';
import '../../repositories/movie/movie_repository.dart';

class MovieUsecases {
  final MovieRepository _movieRepository;

  const MovieUsecases(this._movieRepository);

  Future<Either<NetworkExceptions, MovieListingsEntity>> getPopularMovies({required int page}) async =>
      _movieRepository.getPopularMovies(page: page);

  Future<Either<NetworkExceptions, MovieListingsEntity>> getTopRatedMovies({required int page}) async =>
      _movieRepository.getTopRatedMovies(page: page);
}
