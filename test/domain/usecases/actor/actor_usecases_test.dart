import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/actor/actor_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final ActorRepository mockActorRepository;
  late final ActorUsecases actorUsecases;

  late final ActorDetailEntity tActorDetailEntity;
  late final ActorSocialMediaEntity tActorMovieCreditsEntity;

  setUpAll(() {
    mockActorRepository = MockActorRepository();
    actorUsecases = ActorUsecases(mockActorRepository);

    tActorDetailEntity = const ActorDetailEntity(
      id: 1,
      name: 'name',
      biography: 'biography',
      birthday: 'birthday',
      deathday: 'deathday',
      placeOfBirth: 'placeOfBirth',
      profilePath: 'profilePath',
    );

    tActorMovieCreditsEntity = const ActorSocialMediaEntity(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );
  });

  group('getActorDetail', () {
    const tId = '1';

    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    setUp(() {
      provideDummy<Either<NetworkException, ActorDetailEntity>>(Right(tActorDetailEntity));
      provideDummy<Either<NetworkException, ActorDetailEntity>>(Left(NetworkException.fromDioError(dioException)));
    });

    test('should return [ActorDetailEntity] when the call to repository is successful', () async {
      // arrange
      when(mockActorRepository.getActorDetail(actorId: tId)).thenAnswer((_) async => Right(tActorDetailEntity));
      // act
      final result = await actorUsecases.getActorDetail(actorId: tId);
      // assert
      expect(result, Right(tActorDetailEntity));
      verify(mockActorRepository.getActorDetail(actorId: tId));
      verifyNoMoreInteractions(mockActorRepository);
    });

    test('should return [NetworkException] when the call to repository is unsuccessful', () async {
      // arrange
      when(mockActorRepository.getActorDetail(actorId: tId))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
      // act
      final result = await actorUsecases.getActorDetail(actorId: tId);
      // assert
      expect(result, Left(NetworkException.fromDioError(dioException)));
      verify(mockActorRepository.getActorDetail(actorId: tId));
      verifyNoMoreInteractions(mockActorRepository);
    });
  });

  group('getActorSocialMedia', () {
    const tId = '1';

    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(requestOptions: RequestOptions(), statusCode: 404, statusMessage: 'Not Found'),
    );

    setUp(() {
      provideDummy<Either<NetworkException, ActorSocialMediaEntity>>(Right(tActorMovieCreditsEntity));
      provideDummy<Either<NetworkException, ActorSocialMediaEntity>>(Left(NetworkException.fromDioError(dioException)));
    });

    test('should return [ActorMovieCreditsEntity] when the call to repository is successful', () async {
      // arrange
      when(mockActorRepository.getActorSocialMedia(actorId: tId))
          .thenAnswer((_) async => Right(tActorMovieCreditsEntity));
      // act
      final result = await actorUsecases.getActorSocialMedia(actorId: tId);
      // assert
      expect(result, Right(tActorMovieCreditsEntity));
      verify(mockActorRepository.getActorSocialMedia(actorId: tId));
      verifyNoMoreInteractions(mockActorRepository);
    });

    test('should return [NetworkException] when the call to repository is unsuccessful', () async {
      // arrange
      when(mockActorRepository.getActorSocialMedia(actorId: tId))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));
      // act
      final result = await actorUsecases.getActorSocialMedia(actorId: tId);
      // assert
      expect(result, Left(NetworkException.fromDioError(dioException)));
      verify(mockActorRepository.getActorSocialMedia(actorId: tId));
      verifyNoMoreInteractions(mockActorRepository);
    });
  });
}
