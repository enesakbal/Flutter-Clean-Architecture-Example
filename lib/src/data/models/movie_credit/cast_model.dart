import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie_credit/cast_entity.dart';
import '../../datasources/_mappers/entity_convertable.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel extends Equatable with EntityConvertible<CastModel, CastEntity> {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final int? order;

  const CastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);

  @override
  List<Object?> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order,
    ];
  }

  @override
  CastEntity toEntity() => CastEntity(
        adult: adult,
        castId: castId,
        character: character,
        creditId: creditId,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        order: order,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
      );
}
