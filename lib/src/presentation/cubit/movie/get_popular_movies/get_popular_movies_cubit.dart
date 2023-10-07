import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._movieUsecases) : super(GetPopularMoviesInitial());

  Future<void> getPopularMovies({required int page}) async {
    try {
      emit(const GetPopularMoviesLoading());

      final result = await _movieUsecases.getPopularMovies(page: page);

      result.fold(
        (error) {
          emit(GetPopularMoviesError(message: error.message));
        },
        (success) {
          emit(GetPopularMoviesLoaded(movies: success.movies));
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
