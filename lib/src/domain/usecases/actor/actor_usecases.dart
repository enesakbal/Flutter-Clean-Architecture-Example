import 'package:dartz/dartz.dart';

import '../../../core/network/network_exception.dart';
import '../../entities/actor_detail/actor_detail_entity.dart';
import '../../entities/actor_social_media/actor_social_medias_entity.dart';
import '../../repositories/actor/actor_repository.dart';

class ActorUsecases {
  final ActorRepository _actorRepository;

  const ActorUsecases(this._actorRepository);

  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorDetail({required String actorId}) async =>
      _actorRepository.getActorDetail(actorId: actorId);

  Future<Either<NetworkExceptions, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) async =>
      _actorRepository.getActorSocialMedia(actorId: actorId);
}
