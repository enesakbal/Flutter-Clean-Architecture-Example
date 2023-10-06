import '../_models/actor_detail_model/actor_detail_model.dart';
import '../_models/actor_social_media_model/actor_social_media_model.dart';

/// Abstract class for remote data source of actor entity.
abstract class ActorRemoteDataSource {
  
  /// Returns the actor detail model for the given actor id.
  Future<ActorDetailModel> getActorDetail({required String actorId});

  /// Returns the actor social media model for the given actor id.
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId});
}
