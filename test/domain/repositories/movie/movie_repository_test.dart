import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_credit/cast_model.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_credit/crew_model.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_credit/movie_credit_model.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_detail/movie_detail_model.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_listings/movie_listings_model.dart';
import 'package:flutter_clean_architecture/src/data/repositories/export_repository_impls.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/movie/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieRepository movieRepository;
  late final MovieRemoteDataSource mockMovieRemoteDataSource;
  late final MovieLocalDataSource mockMovieLocalDataSource;

  late final MovieListingsModel tMovieListingsModel;
  late final MovieCreditModel tMovieCreditModel;
  late final MovieDetailModel tMovieDetailModel;

  late final MovieListingsEntity tMovieListingsEntity;
  late final MovieCreditEntity tMovieCreditEntity;
  late final MovieDetailEntity tMovieDetailEntity;

  setUpAll(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    mockMovieLocalDataSource = MockMovieLocalDataSource();
    movieRepository = MovieRepositoryImpl(mockMovieRemoteDataSource, mockMovieLocalDataSource);

    tMovieDetailModel = const MovieDetailModel(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      voteAverage: 1,
      releaseDate: 'releaseDate',
    );

    tMovieDetailEntity = const MovieDetailEntity(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      voteAverage: 1,
      releaseDate: 'releaseDate',
    );

    tMovieListingsModel = MovieListingsModel(
      page: 1,
      totalPages: 1,
      movies: [tMovieDetailModel, tMovieDetailModel],
    );

    tMovieListingsEntity = MovieListingsEntity(
      page: 1,
      totalPages: 1,
      movies: [tMovieDetailEntity, tMovieDetailEntity],
    );

    tMovieCreditModel = const MovieCreditModel(
      id: 1,
      cast: [CastModel(id: 1, name: 'name', character: 'character', profilePath: 'profilePath')],
      crew: [CrewModel(id: 1, name: 'name', profilePath: 'profilePath')],
    );

    tMovieCreditEntity = const MovieCreditEntity(
      id: 1,
      cast: [CastEntity(id: 1, name: 'name', character: 'character', profilePath: 'profilePath')],
      crew: [CrewEntity(id: 1, name: 'name', profilePath: 'profilePath')],
    );
  });

  //* This is the test for the getPopularMovies() method
  group('getPopularMovies', () {
    const tPage = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [MovieListingsEntity] when the call to remote data source is successful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getPopularMovies(page: tPage)).thenAnswer((_) async => tMovieListingsModel);
      // act
      final result = await movieRepository.getPopularMovies(page: tPage);
      // assert
      expect(result, equals(Right(tMovieListingsEntity)));
      verify(mockMovieRemoteDataSource.getPopularMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getPopularMovies(page: tPage)).thenThrow(dioException);
      // act
      final result = await movieRepository.getPopularMovies(page: tPage);
      // assert
      expect(result, equals(Left(NetworkException.fromDioError(dioException))));
      verify(mockMovieRemoteDataSource.getPopularMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  //* This is the test for the getTopRatedMovies() method
  group('getTopRatedMovies', () {
    const tPage = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [MovieListingsEntity] when the call to remote data source is successful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getTopRatedMovies(page: tPage)).thenAnswer((_) async => tMovieListingsModel);
      // act
      final result = await movieRepository.getTopRatedMovies(page: tPage);
      // assert
      expect(result, equals(Right(tMovieListingsEntity)));
      verify(mockMovieRemoteDataSource.getTopRatedMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getTopRatedMovies(page: tPage)).thenThrow(dioException);
      // act
      final result = await movieRepository.getTopRatedMovies(page: tPage);
      // assert
      expect(result, equals(Left(NetworkException.fromDioError(dioException))));
      verify(mockMovieRemoteDataSource.getTopRatedMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  //* This is the test for the getMovieCredits() method
  group('getMovieCredits', () {
    const tMovieId = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [MovieCreditEntity] when the call to remote data source is successful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getMovieCredits(movieId: tMovieId)).thenAnswer((_) async => tMovieCreditModel);
      // act
      final result = await movieRepository.getMovieCredits(movieId: tMovieId);
      // assert
      expect(result, equals(Right(tMovieCreditEntity)));
      verify(mockMovieRemoteDataSource.getMovieCredits(movieId: tMovieId));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockMovieRemoteDataSource.getMovieCredits(movieId: tMovieId)).thenThrow(dioException);
      // act
      final result = await movieRepository.getMovieCredits(movieId: tMovieId);
      // assert
      expect(result, equals(Left(NetworkException.fromDioError(dioException))));
      verify(mockMovieRemoteDataSource.getMovieCredits(movieId: tMovieId));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  // TODO(enesakbl): Add tests for the local data source methods
}
