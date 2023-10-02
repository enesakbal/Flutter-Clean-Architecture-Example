import 'package:dartz/dartz.dart';

import '../../../core/network/network_exception.dart';
import '../../entities/actor_detail/actor_detail_entity.dart';
import '../../entities/actor_social_media/actor_social_medias_entity.dart';

abstract class ActorRepository {
  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorDetail(
      {required String actorId});

  Future<Either<NetworkExceptions, ActorSocialMediaEntity>> getActorSocialMedia(
      {required String actorId});
}
