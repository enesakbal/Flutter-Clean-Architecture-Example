import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/database/database_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:flutter_clean_architecture/src/presentation/cubit/movie/export_movie_cubits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieUsecases mockMovieUsecases;

  late final MovieDetailEntity tMovieDetailEntity1;
  late final MovieDetailEntity tMovieDetailEntity2;
  late final MovieDetailEntity tMovieDetailEntity3;
  late final MovieDetailEntity tMovieDetailEntity4;

  setUpAll(() {
    mockMovieUsecases = MockMovieUsecases();

    tMovieDetailEntity1 = const MovieDetailEntity(
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

  blocTest<GetSavedMoviesCubit, GetSavedMoviesState>(
    'should emit [GetSavedMoviesLoading, GetSavedMoviesLoaded] when success',
    setUp: () {
      final tMovieList = [
        tMovieDetailEntity1,
        tMovieDetailEntity2,
        tMovieDetailEntity3,
        tMovieDetailEntity4,
      ];

      provideDummy<Either<DatabaseException, List<MovieDetailEntity>>>(Right(tMovieList));

      when(mockMovieUsecases.getSavedMovieDetails()).thenAnswer((_) async => Right(tMovieList));
    },
    build: () => GetSavedMoviesCubit(mockMovieUsecases),
    act: (bloc) => bloc.getSavedMovieDetails(),
    expect: () => [
      const GetSavedMoviesLoading(),
      GetSavedMoviesLoaded(
        movies: [
          tMovieDetailEntity1,
          tMovieDetailEntity2,
          tMovieDetailEntity3,
          tMovieDetailEntity4,
        ],
      ),
    ],
    verify: (_) => verify(mockMovieUsecases.getSavedMovieDetails()).called(1),
  );

  blocTest<GetSavedMoviesCubit, GetSavedMoviesState>(
    'should emit [GetSavedMoviesLoading, GetSavedMoviesError] when failure',
    setUp: () {
      final isarError = IsarError('isarError');

      provideDummy<Either<DatabaseException, List<MovieDetailEntity>>>(Left(DatabaseException.fromIsarError(isarError)));

      when(mockMovieUsecases.getSavedMovieDetails())
          .thenAnswer((_) async => Left(DatabaseException.fromIsarError(isarError)));
    },
    build: () => GetSavedMoviesCubit(mockMovieUsecases),
    act: (bloc) => bloc.getSavedMovieDetails(),
    expect: () => [
      const GetSavedMoviesLoading(),
      const GetSavedMoviesError(message: 'isarError'),
    ],
    verify: (_) => verify(mockMovieUsecases.getSavedMovieDetails()).called(1),
  );
}
