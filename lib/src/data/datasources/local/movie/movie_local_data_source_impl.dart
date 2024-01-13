import 'package:isar/isar.dart';

import '../../../../core/database/local_database.dart';
import '../_collections/movie_detail/movie_detail_collection.dart';
import 'movie_local_data_source.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  MovieLocalDataSourceImpl(this.localDatabase);

  final LocalDatabase localDatabase;

  /// Deletes the movie detail with the given [movieId] from the local database.
  @override
  Future<void> deleteMovieDetail({required int? movieId}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async => db.movieDetailCollections.filter().idEqualTo(movieId).deleteAll());
    } catch (_) {
      rethrow;
    }
  }

  /// Retrieves all saved movie details from the local database.
  @override
  Future<List<MovieDetailCollection>> getSavedMovieDetails() async {
    try {
      final list = await localDatabase.db.movieDetailCollections.where().findAll();

      return list;
    } catch (_) {
      rethrow;
    }
  }

  /// Saves the given [movieDetailCollection] to the local database.
  @override
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection}) async {
    try {
      final db = localDatabase.db;

      await db.writeTxn(() async => db.movieDetailCollections.put(movieDetailCollection));
    } catch (_) {
      rethrow;
    }
  }

  /// Checks if the movie detail with the given [movieId] is saved in the local database.
  @override
  Future<bool> isSavedMovieDetail({required int? movieId}) async {
    try {
      final db = localDatabase.db;
      final isSaved = await db.movieDetailCollections.filter().idEqualTo(movieId).isNotEmpty();

      return isSaved;
    } catch (_) {
      rethrow;
    }
  }
}
