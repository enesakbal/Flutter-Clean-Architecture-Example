import '../../../../core/constants/url_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../models/actor_detail/actor_detail_model.dart';
import '../../../models/actor_social_media/actor_social_media_model.dart';
import 'actor_remote_data_source.dart';

class ActorRemoteDataSourceImpl implements ActorRemoteDataSource {
  final DioClient _dioClient;

  const ActorRemoteDataSourceImpl(this._dioClient);

  /// Retrieves the details of the actor with the given [actorId] from the remote data source.
  @override
  Future<ActorDetailModel> getActorDetail({required String actorId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.actorDetail.replaceAll('{person_id}', actorId));

      final model = ActorDetailModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  /// Retrieves the social media accounts of the actor with the given [actorId] from the remote data source.
  @override
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.actorSocialMedia.replaceAll('{person_id}', actorId));

      final model = ActorSocialMediaModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }
}
