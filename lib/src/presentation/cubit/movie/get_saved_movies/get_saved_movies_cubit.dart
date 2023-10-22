import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'get_saved_movies_state.dart';

class GetSavedMoviesCubit extends Cubit<GetSavedMoviesState> {
  GetSavedMoviesCubit(this._movieUsecases) : super(GetSavedMoviesInitial());

  Future<void> getSavedMovieDetails() async {
    try {
      if (state is! GetSavedMoviesLoaded) {
        emit(const GetSavedMoviesLoading());
      }

      final result = await _movieUsecases.getSavedMovieDetails();

      result.fold(
        (error) => emit(GetSavedMoviesError(message: error.message)),
        (success) => emit(GetSavedMoviesLoaded(movies: success)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
