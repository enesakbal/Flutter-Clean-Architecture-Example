part of 'toggle_bookmark_cubit.dart';

sealed class ToggleBookmarkState extends Equatable {
  const ToggleBookmarkState();

  @override
  List<Object> get props => [];
}

final class ToggleBookmarkInitial extends ToggleBookmarkState {
  const ToggleBookmarkInitial();
}

final class ToggleBookmarkLoading extends ToggleBookmarkState {
  const ToggleBookmarkLoading();
}

final class ToggleBookmarkSuccess extends ToggleBookmarkState {
  const ToggleBookmarkSuccess();
}

final class ToggleBookmarkError extends ToggleBookmarkState {
  const ToggleBookmarkError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
