import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/export_entities.dart';
import '../../datasources/_mappers/entity_convertable.dart';
import 'cast_model.dart';
import 'crew_model.dart';

part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditModel extends Equatable with EntityConvertible<MovieCreditModel, MovieCreditEntity> {
  final int? id;
  final List<CastModel>? cast;
  final List<CrewModel>? crew;

  const MovieCreditModel({this.id, this.cast, this.crew});

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) {
    return _$MovieCreditModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieCreditModelToJson(this);

  @override
  List<Object?> get props => [id, cast, crew];

  @override
  MovieCreditEntity toEntity() => MovieCreditEntity(
        id: id,
        cast: cast?.map((e) => e.toEntity()).toList(),
        crew: crew?.map((e) => e.toEntity()).toList(),
      );
}
