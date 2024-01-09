import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/actor_detail/actor_detail_entity.dart';
import '../../entities/actor_social_media/actor_social_medias_entity.dart';
import '../../repositories/actor/actor_repository.dart';

class ActorUsecases {
  final ActorRepository _actorRepository;

  const ActorUsecases(this._actorRepository);

  /// This method gets actor detail from the remote data source.
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId}) async {
    return _actorRepository.getActorDetail(actorId: actorId);
  }

  /// This method gets actor social media from the remote data source.
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) async {
    return _actorRepository.getActorSocialMedia(actorId: actorId);
  }
}
