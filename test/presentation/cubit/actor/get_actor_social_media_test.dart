import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/exceptions/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/domain/entities/export_entities.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:flutter_clean_architecture/src/presentation/cubit/actor/export_actor_cubits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final ActorUsecases mockActorUsecases;

  late final ActorSocialMediaEntity tActorSocialMediaEntity;

  setUpAll(() {
    mockActorUsecases = MockActorUsecases();

    tActorSocialMediaEntity = const ActorSocialMediaEntity(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );
  });

  blocTest<GetActorSocialMediaCubit, GetActorSocialMediaState>(
    'should emit [GetActorSocialMediaLoading, GetActorSocialMediaLoaded] when success',
    build: () {
      provideDummy<Either<NetworkException, ActorSocialMediaEntity>>(Right(tActorSocialMediaEntity));

      when(mockActorUsecases.getActorSocialMedia(actorId: '1')).thenAnswer((_) async => Right(tActorSocialMediaEntity));

      return GetActorSocialMediaCubit(mockActorUsecases);
    },
    act: (bloc) => bloc.getActorSocialMedia(actorId: '1'),
    expect: () => [const GetActorSocialMediaLoading(), GetActorSocialMediaLoaded(data: tActorSocialMediaEntity)],
    verify: (_) => verify(mockActorUsecases.getActorSocialMedia(actorId: '1')).called(1),
  );

  blocTest<GetActorSocialMediaCubit, GetActorSocialMediaState>(
    'should emit [GetActorSocialMediaLoading, GetActorSocialMediaError] when internet connection error occurs with SocketException',
    build: () {
      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: const SocketException(''),
        type: DioExceptionType.connectionError,
      );
      provideDummy<Either<NetworkException, ActorDetailEntity>>(Left(NetworkException.fromDioError(dioException)));

      when(mockActorUsecases.getActorSocialMedia(actorId: '1'))
          .thenAnswer((_) async => Left(NetworkException.fromDioError(dioException)));

      return GetActorSocialMediaCubit(mockActorUsecases);
    },
    act: (bloc) => bloc.getActorSocialMedia(actorId: '1'),
    expect: () => [
      const GetActorSocialMediaLoading(),
      const GetActorSocialMediaError(message: 'Please check your internet connection'),
    ],
    verify: (_) => verify(mockActorUsecases.getActorSocialMedia(actorId: '1')).called(1),
  );
}
