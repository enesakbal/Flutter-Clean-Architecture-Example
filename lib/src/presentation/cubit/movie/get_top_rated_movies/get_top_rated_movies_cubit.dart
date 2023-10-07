import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_top_rated_movies_state.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit(this._movieUsecases) : super(GetTopRatedMoviesInitial());

  int _page = 1;
  final List<MovieDetailEntity> _movieList = [];
  bool loadMore = true;

  Future<void> getTopRatedMovies() async {
    try {
      if (state is! GetTopRatedMoviesLoaded) {
        emit(const GetTopRatedMoviesLoading());
      }

      if (loadMore == false) {
        return;
      }

      final result = await _movieUsecases.getTopRatedMovies(page: _page);

      result.fold(
        (error) => emit(GetTopRatedMoviesError(message: error.message)),
        (success) {
          _page++;
          _movieList.addAll(success.movies ?? []);

          if ((success.movies?.length ?? 0) < 20) {
            loadMore = false;
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
