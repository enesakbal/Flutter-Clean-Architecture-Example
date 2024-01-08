import '../../../models/actor_detail/actor_detail_model.dart';
import '../../../models/actor_social_media/actor_social_media_model.dart';

/// Abstract class for remote data source of actor entity.
abstract class ActorRemoteDataSource {
  /// Returns the actor detail model for the given actor id.
  Future<ActorDetailModel> getActorDetail({required String actorId});

  /// Returns the actor social media model for the given actor id.
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId});
}
