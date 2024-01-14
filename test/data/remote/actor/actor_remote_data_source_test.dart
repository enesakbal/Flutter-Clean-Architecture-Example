import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/constants/url_constants.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:flutter_clean_architecture/src/data/models/export_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final DioClient mockDioClient;
  late final ActorRemoteDataSourceImpl actorRemoteDataSource;

  late final ActorDetailModel tActorDetailModel;
  late final ActorSocialMediaModel tActorSocialMediaModel;

  late final dynamic actorDetailJson;
  late final dynamic actorSocialMediaJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    actorRemoteDataSource = ActorRemoteDataSourceImpl(mockDioClient);

    actorDetailJson = jsonReader('actor_detail_dummy_data.json');
    actorSocialMediaJson = jsonReader('actor_social_media_data.json');

    tActorDetailModel = ActorDetailModel.fromJson(actorDetailJson as Map<String, dynamic>);
    tActorSocialMediaModel = ActorSocialMediaModel.fromJson(actorSocialMediaJson as Map<String, dynamic>);
  });

  //* This is the test for the getActorDetail() method
  group('getActorDetail', () {
    late final Response<dynamic> response;
    late final Exception exception;

    setUpAll(() {
      exception = Exception();

      response = Response<dynamic>(
        data: actorDetailJson,
        requestOptions: RequestOptions(
          path: UrlConstants.actorDetail.replaceAll(
            '{person_id}',
            tActorDetailModel.id.toString(),
          ),
        ),
      );
    });

    test('should return a [ActorDetailModel()] when the call is successful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.actorDetail.replaceAll('{person_id}', tActorDetailModel.id.toString())))
          .thenAnswer((_) async => response);

      // Act
      final result = await actorRemoteDataSource.getActorDetail(actorId: tActorDetailModel.id.toString());

      // Assert
      expect(result, isA<ActorDetailModel>());
      expect(result, equals(tActorDetailModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.actorDetail.replaceAll('{person_id}', tActorDetailModel.id.toString())))
          .thenThrow(exception);

      // Act
      final call = actorRemoteDataSource.getActorDetail;

      // Assert
      expect(() => call(actorId: tActorDetailModel.id.toString()), throwsException);
    });
  });

  //* This is the test for the getActorSocialMedia() method
  group('getActorSocialMedia', () {
    late final Response<dynamic> response;
    late final Exception exception;

    setUpAll(() {
      exception = Exception();

      response = Response<dynamic>(
        data: actorSocialMediaJson,
        requestOptions: RequestOptions(
          path: UrlConstants.actorSocialMedia.replaceAll('{person_id}', tActorSocialMediaModel.id.toString()),
        ),
      );
    });

    test('should return a [ActorSocialMediaModel()] when the call is successful', () async {
      // Arrange
      when(mockDioClient
              .get(UrlConstants.actorSocialMedia.replaceAll('{person_id}', tActorSocialMediaModel.id.toString())))
          .thenAnswer((_) async => response);

      // Act
      final result = await actorRemoteDataSource.getActorSocialMedia(actorId: tActorSocialMediaModel.id.toString());

      // Assert
      expect(result, isA<ActorSocialMediaModel>());
      expect(result, equals(tActorSocialMediaModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful', () async {
      // Arrange
      when(mockDioClient
              .get(UrlConstants.actorSocialMedia.replaceAll('{person_id}', tActorSocialMediaModel.id.toString())))
          .thenThrow(exception);

      // Act
      final call = actorRemoteDataSource.getActorSocialMedia;

      // Assert
      expect(() => call(actorId: tActorSocialMediaModel.id.toString()), throwsException);
    });
  });
}
