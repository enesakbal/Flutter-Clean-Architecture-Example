import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../../domain/entities/actor_detail/actor_detail_entity.dart';
import '../../../domain/entities/actor_social_media/actor_social_medias_entity.dart';
import '../../../domain/repositories/actor/actor_repository.dart';
import '../../datasources/export_datasources.dart';

class ActorRepositoryImpl implements ActorRepository {
  final ActorRemoteDataSource _actorRemoteDataSource;

  ActorRepositoryImpl(this._actorRemoteDataSource);

  @override
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId}) async {
    try {
      final result = await _actorRemoteDataSource.getActorDetail(actorId: actorId);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) async {
    try {
      final result = await _actorRemoteDataSource.getActorSocialMedia(actorId: actorId);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
