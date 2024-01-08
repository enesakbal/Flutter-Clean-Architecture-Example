// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import '../../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../_mappers/entity_convertable.dart';

part 'movie_detail_collection.g.dart';

@collection
class MovieDetailCollection with EntityConvertible<MovieDetailCollection, MovieDetailEntity> {
  final Id? id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailCollection({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  MovieDetailCollection fromEntity(MovieDetailEntity? model) {
    return MovieDetailCollection(
      adult: model?.adult,
      backdropPath: model?.backdropPath,
      genreIds: model?.genreIds,
      id: model?.id,
      originalLanguage: model?.originalLanguage,
      originalTitle: model?.originalTitle,
      overview: model?.overview,
      popularity: model?.popularity,
      posterPath: model?.posterPath,
      releaseDate: model?.releaseDate,
      title: model?.title,
      video: model?.video,
      voteAverage: model?.voteAverage,
      voteCount: model?.voteCount,
    );
  }
}
