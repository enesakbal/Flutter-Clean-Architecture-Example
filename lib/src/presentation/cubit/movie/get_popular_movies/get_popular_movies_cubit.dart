import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._movieUsecases) : super(GetPopularMoviesInitial());

  int _page = 1;
  final List<MovieDetailEntity> _movieList = [];
  bool loadMore = true;

  Future<void> getPopularMovies() async {
    try {
      if (state is! GetPopularMoviesLoaded) {
        emit(const GetPopularMoviesLoading());
      }

      if (loadMore == false) {
        return;
      }

      final result = await _movieUsecases.getPopularMovies(page: _page);

      result.fold(
        (error) => emit(GetPopularMoviesError(message: error.message)),
        (success) {
          _page++;
          _movieList.addAll(success.movies ?? []);

          if ((success.movies?.length ?? 0) < 20) {
            loadMore = false;
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
