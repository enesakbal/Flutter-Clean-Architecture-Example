// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_social_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorSocialMediaModel _$ActorSocialMediaModelFromJson(
        Map<String, dynamic> json) =>
    ActorSocialMediaModel(
      id: json['id'] as int?,
      freebaseMid: json['freebase_mid'] as String?,
      freebaseId: json['freebase_id'] as String?,
      imdbId: json['imdb_id'] as String?,
      tvrageId: json['tvrage_id'] as int?,
      wikidataId: json['wikidata_id'] as String?,
      facebookId: json['facebook_id'] as String?,
      instagramId: json['instagram_id'] as String?,
      tiktokId: json['tiktok_id'] as String?,
      twitterId: json['twitter_id'] as String?,
      youtubeId: json['youtube_id'] as String?,
    );

Map<String, dynamic> _$ActorSocialMediaModelToJson(
        ActorSocialMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freebase_mid': instance.freebaseMid,
      'freebase_id': instance.freebaseId,
      'imdb_id': instance.imdbId,
      'tvrage_id': instance.tvrageId,
      'wikidata_id': instance.wikidataId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'tiktok_id': instance.tiktokId,
      'twitter_id': instance.twitterId,
      'youtube_id': instance.youtubeId,
    };
