import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../_collections/movie_detail/movie_detail_collection.dart';
import 'movie_local_data_source.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  const MovieLocalDataSourceImpl();

  /// Opens the Isar database and returns a [Future] of [Isar] instance.
  Future<Isar> _openDb() async {
    final directory = await getApplicationDocumentsDirectory();
    return Isar.open([MovieDetailCollectionSchema], directory: directory.path);
  }

  /// Deletes the movie detail with the given [movieId] from the local database.
  @override
  Future<void> deleteMovieDetail({required int? movieId}) async {
    try {
      final db = await _openDb();

      db.writeTxn(() async => db.movieDetailCollections.filter().idEqualTo(movieId).deleteAll());

      await db.close();
    } catch (_) {
      rethrow;
    }
  }

  /// Retrieves all saved movie details from the local database.
  @override
  Future<List<MovieDetailCollection>> getSavedMovieDetails() async {
    try {
      final db = await _openDb();

      final list = await db.movieDetailCollections.where().findAll();

      await db.close();

      return list;
    } catch (_) {
      rethrow;
    }
  }

  /// Saves the given [movieDetailCollection] to the local database.
  @override
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection}) async {
    try {
      final db = await _openDb();
      db.writeTxn(() async => db.movieDetailCollections.put(movieDetailCollection));

      await db.close();
    } catch (_) {
      rethrow;
    }
  }

  /// Checks if the movie detail with the given [movieId] is saved in the local database.
  @override
  Future<bool> isSavedMovieDetail({required int? movieId}) async {
    try {
      final db = await _openDb();

      final isSaved = await db.movieDetailCollections.filter().idEqualTo(movieId).isNotEmpty();

      await db.close();

      return isSaved;
    } catch (_) {
      rethrow;
    }
  }
}
