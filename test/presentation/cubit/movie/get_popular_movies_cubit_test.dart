import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:flutter_clean_architecture/src/presentation/cubit/movie/export_movie_cubits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieUsecases mockMovieUsecases;

  late final MovieDetailEntity tMovieDetailEntity;
  late final MovieDetailEntity tMovieDetailEntity2;
  late final MovieDetailEntity tMovieDetailEntity3;
  late final MovieDetailEntity tMovieDetailEntity4;

  setUpAll(() {
    mockMovieUsecases = MockMovieUsecases();

    tMovieDetailEntity = const MovieDetailEntity(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
    );

    tMovieDetailEntity2 = const MovieDetailEntity(
      id: 2,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
    );

    tMovieDetailEntity3 = const MovieDetailEntity(
      id: 3,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
    );

    tMovieDetailEntity4 = const MovieDetailEntity(
      id: 4,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
    );
  });

  blocTest<GetPopularMoviesCubit, GetPopularMoviesState>(
    'should emit [GetPopularMoviesLoading, GetPopularMoviesLoaded] when success with different movie details in the response body',
    setUp: () {
      const tPage = 1;
      const tTotalPages = 10;

      final tMovieListingsEntity = MovieListingsEntity(
        page: tPage,
        totalPages: tTotalPages,
        movies: [tMovieDetailEntity, tMovieDetailEntity2, tMovieDetailEntity3, tMovieDetailEntity4],
      );

      provideDummy<Either<NetworkException, MovieListingsEntity>>(Right(tMovieListingsEntity));

      when(mockMovieUsecases.getPopularMovies(page: tPage)).thenAnswer((_) async => Right(tMovieListingsEntity));
    },
    build: () => GetPopularMoviesCubit(mockMovieUsecases),
    act: (bloc) => bloc.getPopularMovies(),
    expect: () => [
      const GetPopularMoviesLoading(),
      GetPopularMoviesLoaded(
          movies: [tMovieDetailEntity, tMovieDetailEntity2, tMovieDetailEntity3, tMovieDetailEntity4])
    ],
    verify: (_) => verify(mockMovieUsecases.getPopularMovies(page: 1)).called(1),
  );

  blocTest<GetPopularMoviesCubit, GetPopularMoviesState>(
    'should emit [GetPopularMoviesLoading, GetPopularMoviesLoaded] when success with same movie details in the response body (duplicate)',
    setUp: () {
      const tPage = 1;
      const tTotalPages = 10;

      final tMovieListingsEntity = MovieListingsEntity(
        page: tPage,
        totalPages: tTotalPages,
        movies: [tMovieDetailEntity, tMovieDetailEntity3, tMovieDetailEntity3, tMovieDetailEntity4, tMovieDetailEntity],
      );

      provideDummy<Either<NetworkException, MovieListingsEntity>>(Right(tMovieListingsEntity));

      when(mockMovieUsecases.getPopularMovies(page: tPage)).thenAnswer((_) async => Right(tMovieListingsEntity));
    },
    build: () => GetPopularMoviesCubit(mockMovieUsecases),
    act: (bloc) => bloc.getPopularMovies(),
    expect: () => [
      const GetPopularMoviesLoading(),
      GetPopularMoviesLoaded(movies: [tMovieDetailEntity, tMovieDetailEntity3, tMovieDetailEntity4])
    ],
    verify: (_) => verify(mockMovieUsecases.getPopularMovies(page: 1)).called(1),
  );

  blocTest<GetPopularMoviesCubit, GetPopularMoviesState>(
    'should emit [GetPopularMoviesLoading, GetPopularMoviesError] when internet connection error occurs with SocketException',
    setUp: () {
      const tPage = 1;

      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: const SocketException(''),
        type: DioExceptionType.connectionError,
      );

      provideDummy<Either<NetworkException, MovieListingsEntity>>(Left(NetworkException.fromDioError(dioException)));

      when(mockMovieUsecases.getPopularMovies(page: tPage))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
    },
    build: () => GetPopularMoviesCubit(mockMovieUsecases),
    act: (bloc) => bloc.getPopularMovies(),
    expect: () => [
      const GetPopularMoviesLoading(),
      const GetPopularMoviesError(message: 'Please check your internet connection')
    ],
    verify: (_) => verify(mockMovieUsecases.getPopularMovies(page: 1)).called(1),
  );
}
