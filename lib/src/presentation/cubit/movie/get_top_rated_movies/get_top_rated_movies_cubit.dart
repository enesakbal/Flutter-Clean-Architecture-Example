import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_top_rated_movies_state.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit(this._movieUsecases) : super(GetTopRatedMoviesInitial());

  /// The list of popular movie details.
  final List<MovieDetailEntity> _movieList = [];

  /// The current page number for fetching popular movies.
  int _page = 1;

  /// A flag indicating whether the maximum number of movies has been reached.
  bool hasReachedMax = false;

  Future<void> getTopRatedMovies() async {
    try {
      // Checks if the maximum limit has been reached.
      if (hasReachedMax) return;

      /// Checks if the current state is not [GetPopularMoviesLoaded].
      /// If it is not, emits a [GetPopularMoviesLoading] state.
      if (state is! GetTopRatedMoviesLoaded) {
        emit(const GetTopRatedMoviesLoading());
      }

      final result = await _movieUsecases.getTopRatedMovies(page: _page);

      result.fold(
        (error) => emit(GetTopRatedMoviesError(message: error.message)),
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

          emit(GetTopRatedMoviesLoaded(movies: List.of(_movieList)));
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
