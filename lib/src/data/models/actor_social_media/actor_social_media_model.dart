import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/actor_social_media/actor_social_medias_entity.dart';
import '../../datasources/_mappers/entity_convertable.dart';

part 'actor_social_media_model.g.dart';

@JsonSerializable()
class ActorSocialMediaModel extends Equatable with EntityConvertible<ActorSocialMediaModel, ActorSocialMediaEntity> {
  final int? id;
  @JsonKey(name: 'freebase_mid')
  final String? freebaseMid;
  @JsonKey(name: 'freebase_id')
  final String? freebaseId;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'tvrage_id')
  final int? tvrageId;
  @JsonKey(name: 'wikidata_id')
  final String? wikidataId;
  @JsonKey(name: 'facebook_id')
  final String? facebookId;
  @JsonKey(name: 'instagram_id')
  final String? instagramId;
  @JsonKey(name: 'tiktok_id')
  final String? tiktokId;
  @JsonKey(name: 'twitter_id')
  final String? twitterId;
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;

  const ActorSocialMediaModel({
    this.id,
    this.freebaseMid,
    this.freebaseId,
    this.imdbId,
    this.tvrageId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.tiktokId,
    this.twitterId,
    this.youtubeId,
  });

  factory ActorSocialMediaModel.fromJson(Map<String, dynamic> json) {
    return _$ActorSocialMediaModelFromJson(json);
  }

  @override
  ActorSocialMediaEntity toEntity() => ActorSocialMediaEntity(
        facebookId: facebookId,
        freebaseId: freebaseId,
        freebaseMid: freebaseMid,
        id: id,
        imdbId: imdbId,
        instagramId: instagramId,
        tiktokId: tiktokId,
        tvrageId: tvrageId,
        twitterId: twitterId,
        wikidataId: wikidataId,
        youtubeId: youtubeId,
      );

  Map<String, dynamic> toJson() => _$ActorSocialMediaModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      freebaseMid,
      freebaseId,
      imdbId,
      tvrageId,
      wikidataId,
      facebookId,
      instagramId,
      tiktokId,
      twitterId,
      youtubeId,
    ];
  }
}
