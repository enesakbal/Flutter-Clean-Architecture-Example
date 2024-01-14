import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/movie/movie_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/movie/movie_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieRepository mockMovieRepository;
  late final MovieUsecases movieUsecases;

  late final MovieListingsEntity tMovieListingsEntity;
  late final MovieCreditEntity tMovieCreditEntity;
  late final MovieDetailEntity tMovieDetailEntity;

  setUpAll(() {
    mockMovieRepository = MockMovieRepository();
    movieUsecases = MovieUsecases(mockMovieRepository);

    tMovieDetailEntity = const MovieDetailEntity(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      voteAverage: 1,
      releaseDate: 'releaseDate',
    );

    tMovieListingsEntity = MovieListingsEntity(
      page: 1,
      totalPages: 1,
      movies: [tMovieDetailEntity, tMovieDetailEntity],
    );

    tMovieCreditEntity = const MovieCreditEntity(
      id: 1,
      cast: [
        CastEntity(id: 1, name: 'name', character: 'character', profilePath: 'profilePath'),
        CastEntity(id: 1, name: 'name', character: 'character', profilePath: 'profilePath'),
      ],
    );
  });

  group('getPopularMovies', () {
    const tPage = 1;

    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(requestOptions: RequestOptions(), statusCode: 404, statusMessage: 'Not Found'),
    );

    setUp(() {
      provideDummy<Either<NetworkException, MovieListingsEntity>>(Right(tMovieListingsEntity));
      provideDummy<Either<NetworkException, MovieListingsEntity>>(Left(NetworkException.fromDioError(dioException)));
    });

    test('should return [tMovieListingsEntity] when the call to repository is successful', () async {
      // arrange
      when(mockMovieRepository.getPopularMovies(page: tPage)).thenAnswer((_) async => Right(tMovieListingsEntity));

      // act
      final result = await movieUsecases.getPopularMovies(page: 1);
      // assert
      expect(result, Right(tMovieListingsEntity));
      verify(mockMovieRepository.getPopularMovies(page: 1));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should return a [NetworkException] when the call to repository is unsuccessful', () async {
      // arrange
      when(mockMovieRepository.getPopularMovies(page: tPage))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
      // act
      final result = await movieUsecases.getPopularMovies(page: 1);
      // assert
      expect(result, Left(NetworkException.fromDioError(dioException)));
      verify(mockMovieRepository.getPopularMovies(page: 1));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });

  group('getTopRatedMovies', () {
    const tPage = 1;

    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(requestOptions: RequestOptions(), statusCode: 404, statusMessage: 'Not Found'),
    );

    setUp(() {
      provideDummy<Either<NetworkException, MovieListingsEntity>>(Right(tMovieListingsEntity));
      provideDummy<Either<NetworkException, MovieListingsEntity>>(Left(NetworkException.fromDioError(dioException)));
    });

    test('should return [MovieListingsEntity] when the call to repository is successful', () async {
      // arrange
      when(mockMovieRepository.getTopRatedMovies(page: tPage)).thenAnswer((_) async => Right(tMovieListingsEntity));
      // act
      final result = await movieUsecases.getTopRatedMovies(page: 1);
      // assert
      expect(result, Right(tMovieListingsEntity));
      verify(mockMovieRepository.getTopRatedMovies(page: 1));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should return a [NetworkException] when the call to repository is unsuccessful', () async {
      // arrange
      when(mockMovieRepository.getTopRatedMovies(page: tPage))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
      // act
      final result = await movieUsecases.getTopRatedMovies(page: 1);
      // assert
      expect(result, Left(NetworkException.fromDioError(dioException)));
      verify(mockMovieRepository.getTopRatedMovies(page: 1));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });

  group('getMovieCredits', () {
    const tMovieId = 1;

    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(requestOptions: RequestOptions(), statusCode: 404, statusMessage: 'Not Found'),
    );

    setUp(() {
      provideDummy<Either<NetworkException, MovieCreditEntity>>(Right(tMovieCreditEntity));
      provideDummy<Either<NetworkException, MovieCreditEntity>>(Left(NetworkException.fromDioError(dioException)));
    });

    test('should return [MovieCreditEntity] when the call to repository is successful', () async {
      // arrange
      when(mockMovieRepository.getMovieCredits(movieId: tMovieId)).thenAnswer((_) async => Right(tMovieCreditEntity));
      // act
      final result = await movieUsecases.getMovieCredits(movieId: tMovieId);
      // assert
      expect(result, Right(tMovieCreditEntity));
      verify(mockMovieRepository.getMovieCredits(movieId: tMovieId));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should return a [NetworkException] when the call to repository is unsuccessful', () async {
      // arrange
      when(mockMovieRepository.getMovieCredits(movieId: tMovieId))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
      // act
      final result = await movieUsecases.getMovieCredits(movieId: tMovieId);
      // assert
      expect(result, Left(NetworkException.fromDioError(dioException)));
      verify(mockMovieRepository.getMovieCredits(movieId: tMovieId));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}


// TODO(enesakbl): add local data source tests
