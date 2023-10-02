import 'package:equatable/equatable.dart';

class ActorSocialMediaEntity extends Equatable {
  final int? id;
  final String? freebaseMid;
  final String? freebaseId;
  final String? imdbId;
  final int? tvrageId;
  final String? wikidataId;
  final String? facebookId;
  final String? instagramId;
  final String? tiktokId;
  final String? twitterId;
  final String? youtubeId;

  const ActorSocialMediaEntity({
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
