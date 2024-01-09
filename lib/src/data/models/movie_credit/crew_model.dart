import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie_credit/crew_entity.dart';
import '../../datasources/_mappers/entity_convertable.dart';

part 'crew_model.g.dart';

@JsonSerializable()
class CrewModel extends Equatable with EntityConvertible<CrewModel, CrewEntity> {
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
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final String? department;
  final String? job;

  const CrewModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) => _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);

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
      creditId,
      department,
      job,
    ];
  }

  @override
  CrewEntity toEntity() {
    return CrewEntity(
      adult: adult,
      creditId: creditId,
      department: department,
      gender: gender,
      id: id,
      job: job,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
    );
  }
}
