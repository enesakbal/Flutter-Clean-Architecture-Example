import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:flutter_clean_architecture/src/presentation/cubit/movie/get_movie_credits/get_movie_credits_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieUsecases mockMovieUsecases;

  late final MovieCreditEntity tMovieCreditEntity;

  setUpAll(() {
    mockMovieUsecases = MockMovieUsecases();

    tMovieCreditEntity = const MovieCreditEntity(
      id: 1,
      cast: [
        CastEntity(id: 1, name: 'name', profilePath: 'profilePath', character: 'character'),
        CastEntity(id: 2, name: 'name', profilePath: 'profilePath', character: 'character'),
      ],
      crew: [
        CrewEntity(id: 1, name: 'name', profilePath: 'profilePath', job: 'job'),
        CrewEntity(id: 2, name: 'name', profilePath: 'profilePath', job: 'job'),
      ],
    );
  });

  blocTest<GetMovieCreditsCubit, GetMovieCreditsState>(
    'should emit [GetMovieCreditsLoading, GetMovieCreditsLoaded] when success',
    build: () {
      provideDummy<Either<NetworkException, MovieCreditEntity>>(Right(tMovieCreditEntity));

      when(mockMovieUsecases.getMovieCredits(movieId: tMovieCreditEntity.id ?? 0))
          .thenAnswer((_) async => Right(tMovieCreditEntity));

      return GetMovieCreditsCubit(mockMovieUsecases);
    },
    act: (bloc) => bloc.getMovieCredits(tMovieCreditEntity.id ?? 0),
    expect: () => [const GetMovieCreditsLoading(), GetMovieCreditsLoaded(tMovieCreditEntity)],
    verify: (_) => verify(mockMovieUsecases.getMovieCredits(movieId: tMovieCreditEntity.id ?? 0)).called(1),
  );

  blocTest<GetMovieCreditsCubit, GetMovieCreditsState>(
    'should emit [GetMovieCreditsLoading, GetMovieCreditsError] when internet connection error occurs with SocketException',
    build: () {
      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: const SocketException(''),
        type: DioExceptionType.connectionError,
      );

      provideDummy<Either<NetworkException, MovieCreditEntity>>(Left(NetworkException.fromDioError(dioException)));

      when(mockMovieUsecases.getMovieCredits(movieId: tMovieCreditEntity.id ?? 0))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));

      return GetMovieCreditsCubit(mockMovieUsecases);
    },
    act: (bloc) => bloc.getMovieCredits(tMovieCreditEntity.id ?? 0),
    expect: () => [const GetMovieCreditsLoading(), const GetMovieCreditsError('Please check your internet connection')],
    verify: (_) => verify(mockMovieUsecases.getMovieCredits(movieId: tMovieCreditEntity.id ?? 0)).called(1),
  );
}
