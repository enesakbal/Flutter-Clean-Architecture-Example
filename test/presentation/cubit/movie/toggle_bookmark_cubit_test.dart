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

  late final MovieDetailEntity tMovieDetailEntity;

  setUpAll(() {
    mockMovieUsecases = MockMovieUsecases();

    tMovieDetailEntity = const MovieDetailEntity(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
    );
  });

  blocTest<ToggleBookmarkCubit, ToggleBookmarkState>(
    'should emit [ToggleBookmarkLoading, ToggleBookmarkLoaded] when success',
    setUp: () {
      provideDummy<Either<DatabaseException, void>>(const Right(null));

      when(mockMovieUsecases.toggleBookmark(movieDetailEntity: tMovieDetailEntity))
          .thenAnswer((_) async => const Right(null));
    },
    build: () => ToggleBookmarkCubit(mockMovieUsecases),
    act: (ToggleBookmarkCubit cubit) => cubit.toggleBookmark(movieDetailEntity: tMovieDetailEntity),
    expect: () => [
      const ToggleBookmarkLoading(),
      const ToggleBookmarkSuccess(),
    ],
    verify: (_) {
      verify(mockMovieUsecases.toggleBookmark(movieDetailEntity: tMovieDetailEntity)).called(1);
    },
  );

  blocTest<ToggleBookmarkCubit, ToggleBookmarkState>(
    'should emit [ToggleBookmarkLoading, ToggleBookmarkError] when failure',
    setUp: () {
      final isarError = IsarError('isarError');

      provideDummy<Either<DatabaseException, void>>(Left(DatabaseException.fromIsarError(isarError)));

      when(mockMovieUsecases.toggleBookmark(movieDetailEntity: tMovieDetailEntity))
          .thenAnswer((_) async => Left(DatabaseException.fromIsarError(isarError)));
    },
    build: () => ToggleBookmarkCubit(mockMovieUsecases),
    act: (ToggleBookmarkCubit cubit) => cubit.toggleBookmark(movieDetailEntity: tMovieDetailEntity),
    expect: () => [
      const ToggleBookmarkLoading(),
      const ToggleBookmarkError(message: 'isarError'),
    ],
    verify: (_) => verify(mockMovieUsecases.toggleBookmark(movieDetailEntity: tMovieDetailEntity)).called(1),
  );
}
