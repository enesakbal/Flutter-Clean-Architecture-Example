import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_detail/movie_detail_entity.dart';
import '../../../../domain/usecases/export_usecases.dart';

part 'toggle_bookmark_state.dart';

class ToggleBookmarkCubit extends Cubit<ToggleBookmarkState> {
  ToggleBookmarkCubit(this._movieUsecases) : super(const ToggleBookmarkInitial());

  Future<void> toggleBookmark({required MovieDetailEntity? movieDetailEntity}) async {
    try {
      emit(const ToggleBookmarkLoading());

      final result = await _movieUsecases.toggleBookmark(movieDetailEntity: movieDetailEntity);

      result.fold(
        (error) => emit(ToggleBookmarkError(message: error.message)),
        (success) => emit(const ToggleBookmarkSuccess()),
      );
    } catch (_) {
      rethrow;
    }
  }

  final MovieUsecases _movieUsecases;
}
