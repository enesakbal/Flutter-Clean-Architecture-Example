import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_top_rated_movies_state.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit(this._movieUsecases) : super(GetTopRatedMoviesInitial());

  Future<void> getTopRatedMovies({required int page}) async {
    try {
      emit(const GetTopRatedMoviesLoading());

      final result = await _movieUsecases.getTopRatedMovies(page: page);

      result.fold(
        (error) {
          emit(GetTopRatedMoviesError(message: error.message));
        },
        (success) {
          emit(GetTopRatedMoviesLoaded(movies: success.movies));
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
