// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditModel _$MovieCreditModelFromJson(Map<String, dynamic> json) =>
    MovieCreditModel(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditModelToJson(MovieCreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
