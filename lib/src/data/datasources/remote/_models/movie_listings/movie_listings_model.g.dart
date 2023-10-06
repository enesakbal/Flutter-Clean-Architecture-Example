// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListingsModel _$MovieListingsModelFromJson(Map<String, dynamic> json) =>
    MovieListingsModel(
      page: json['page'] as int?,
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$MovieListingsModelToJson(MovieListingsModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
