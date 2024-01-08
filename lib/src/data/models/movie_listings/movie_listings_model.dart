import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie_listings/movie_listings_entity.dart';
import '../../datasources/_mappers/entity_convertable.dart';
import '../movie_detail/movie_detail_model.dart';

part 'movie_listings_model.g.dart';

@JsonSerializable()
class MovieListingsModel extends Equatable with EntityConvertible<MovieListingsModel, MovieListingsEntity> {
  final int? page;
  @JsonKey(name: 'results')
  final List<MovieDetailModel>? movies;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const MovieListingsModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieListingsModelFromJson(json);
  }

  @override
  MovieListingsEntity toEntity() => MovieListingsEntity(
        movies: movies?.map((e) => e.toEntity()).toList(),
        page: page,
        totalPages: totalPages,
        totalResults: totalResults,
      );

  Map<String, dynamic> toJson() => _$MovieListingsModelToJson(this);

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}
