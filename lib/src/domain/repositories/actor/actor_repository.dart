import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/actor_detail/actor_detail_entity.dart';
import '../../entities/actor_social_media/actor_social_medias_entity.dart';

abstract class ActorRepository {
  /// Retrieves the detailed information of an actor.
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId});

  /// Retrieves the social media information of an actor.
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId});
}
