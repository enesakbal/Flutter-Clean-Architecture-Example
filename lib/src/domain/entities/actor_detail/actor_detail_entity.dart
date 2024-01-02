import 'package:equatable/equatable.dart';

class ActorDetailEntity extends Equatable {
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final int? gender;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;

  const ActorDetailEntity({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  @override
  List<Object?> get props {
    return [
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
    ];
  }
}
