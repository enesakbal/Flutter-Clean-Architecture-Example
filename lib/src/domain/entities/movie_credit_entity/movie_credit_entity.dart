import 'package:equatable/equatable.dart';

import 'cast_entity.dart';
import 'crew_entity.dart';

class MovieCreditEntity extends Equatable {
  final int? id;
  final List<CastEntity>? cast;
  final List<CrewEntity>? crew;

  const MovieCreditEntity({this.id, this.cast, this.crew});

  @override
  List<Object?> get props => [id, cast, crew];
}
