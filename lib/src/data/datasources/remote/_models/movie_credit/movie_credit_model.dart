import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cast_model.dart';
import 'crew_model.dart';

part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditModel extends Equatable {
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
}
