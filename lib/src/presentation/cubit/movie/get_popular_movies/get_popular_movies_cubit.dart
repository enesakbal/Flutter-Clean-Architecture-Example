import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._movieUsecases) : super(GetPopularMoviesInitial());

  /// The list of popular movie details.
  final List<MovieDetailEntity> _movieList = [];

  /// The current page number for fetching popular movies.
  int _page = 1;

  /// A flag indicating whether the maximum number of movies has been reached.
  bool hasReachedMax = false;

  Future<void> getPopularMovies() async {
    try {
      // Checks if the maximum limit has been reached.
      if (hasReachedMax) return;

      /// Checks if the current state is not [GetPopularMoviesLoaded].
      /// If it is not, emits a [GetPopularMoviesLoading] state.
      if (state is! GetPopularMoviesLoaded) {
        emit(const GetPopularMoviesLoading());
      }

      final result = await _movieUsecases.getPopularMovies(page: _page);

      result.fold(
        (error) => emit(GetPopularMoviesError(message: error.message)),
        (success) {
          // Increases the page number and adds the movies from the [success] response to the movie list.
          // If a movie already exists in the movie list, it will not be added again.
          // If the number of movies in the [success] response is less than 20, sets [hasReachedMax] to true.
          // Emits a [GetPopularMoviesLoaded] state with the updated movie list.

          _page++;
          _movieList.addAll(success.movies?.where((movie) => _movieList.contains(movie) == false) ?? []);

          /// Checks if the number of movies in the [success] response is less than 20.
          /// If so, sets [hasReachedMax] to true.
          if ((success.movies?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(GetPopularMoviesLoaded(movies: List.of(_movieList)));
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
