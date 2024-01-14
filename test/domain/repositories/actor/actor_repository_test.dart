import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:flutter_clean_architecture/src/data/models/actor_detail/actor_detail_model.dart';
import 'package:flutter_clean_architecture/src/data/models/actor_social_media/actor_social_media_model.dart';
import 'package:flutter_clean_architecture/src/data/repositories/export_repository_impls.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/export_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final ActorRemoteDataSource mockActorRemoteDataSource;
  late final ActorRepository actorRepositoryImpl;

  late final ActorDetailModel tActorDetailModel;
  late final ActorSocialMediaModel tActorSocialMediaModel;

  late final ActorDetailEntity tActorDetailEntity;
  late final ActorSocialMediaEntity tActorSocialMediaEntity;

  setUpAll(() {
    mockActorRemoteDataSource = MockActorRemoteDataSource();
    actorRepositoryImpl = ActorRepositoryImpl(mockActorRemoteDataSource);

    tActorDetailModel = const ActorDetailModel(
      id: 1,
      name: 'name',
      biography: 'biography',
      birthday: 'birthday',
      deathday: 'deathday',
      placeOfBirth: 'placeOfBirth',
      profilePath: 'profilePath',
    );

    tActorDetailEntity = const ActorDetailEntity(
      id: 1,
      name: 'name',
      biography: 'biography',
      birthday: 'birthday',
      deathday: 'deathday',
      placeOfBirth: 'placeOfBirth',
      profilePath: 'profilePath',
    );

    tActorSocialMediaModel = const ActorSocialMediaModel(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );

    tActorSocialMediaEntity = const ActorSocialMediaEntity(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );
  });

  group('getActorDetail', () {
    const tId = '1';
    final tDioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [ActorDetailEntity] when the call to remote data source is successful', () async {
      // arrange
      when(mockActorRemoteDataSource.getActorDetail(actorId: tId)).thenAnswer((_) async => tActorDetailModel);
      // act
      final result = await actorRepositoryImpl.getActorDetail(actorId: tId);
      // assert
      expect(result, equals(Right(tActorDetailEntity)));
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockActorRemoteDataSource.getActorDetail(actorId: tId)).thenThrow(tDioException);
      // act
      final result = await actorRepositoryImpl.getActorDetail(actorId: tId);
      // assert
      expect(result, equals(Left(NetworkException.fromDioError(tDioException))));
    });
  });

  group('getActorSocialMedia', () {
    const tId = '1';
    final tDioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [ActorDetailEntity] when the call to remote data source is successful', () async {
      // arrange
      when(mockActorRemoteDataSource.getActorSocialMedia(actorId: tId)).thenAnswer((_) async => tActorSocialMediaModel);
      // act
      final result = await actorRepositoryImpl.getActorSocialMedia(actorId: tId);
      // assert
      expect(result, equals(Right(tActorSocialMediaEntity)));
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      // arrange
      when(mockActorRemoteDataSource.getActorSocialMedia(actorId: tId)).thenThrow(tDioException);
      // act
      final result = await actorRepositoryImpl.getActorSocialMedia(actorId: tId);
      // assert
      expect(result, equals(Left(NetworkException.fromDioError(tDioException))));
    });
  });
}
