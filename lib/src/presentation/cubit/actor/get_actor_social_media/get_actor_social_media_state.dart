part of 'get_actor_social_media_cubit.dart';

sealed class GetActorSocialMediaState extends Equatable {
  const GetActorSocialMediaState();

  @override
  List<Object> get props => [];
}

final class GetActorSocialMediaInitial extends GetActorSocialMediaState {}

final class GetActorSocialMediaLoading extends GetActorSocialMediaState {
  const GetActorSocialMediaLoading();
}

final class GetActorSocialMediaLoaded extends GetActorSocialMediaState {
  const GetActorSocialMediaLoaded({required this.data});

  final ActorSocialMediaEntity data;

  String? get instagramId => data.instagramId;
  String? get twitterId => data.twitterId;
  String? get facebookId => data.facebookId;
  String? get youtubeId => data.youtubeId;
  String? get imdbId => data.imdbId;
  String? get tiktokId => data.tiktokId;

  @override
  List<Object> get props => [data];
}

final class GetActorSocialMediaError extends GetActorSocialMediaState {
  const GetActorSocialMediaError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
