part of 'get_saved_movies_cubit.dart';

sealed class GetSavedMoviesState extends Equatable {
  const GetSavedMoviesState();

  @override
  List<Object> get props => [];
}

final class GetSavedMoviesInitial extends GetSavedMoviesState {}

final class GetSavedMoviesLoading extends GetSavedMoviesState {
  const GetSavedMoviesLoading();
}

final class GetSavedMoviesLoaded extends GetSavedMoviesState {
  const GetSavedMoviesLoaded({required this.movies});

  final List<MovieDetailEntity>? movies;

  @override
  List<Object> get props => [movies!];
}

final class GetSavedMoviesError extends GetSavedMoviesState {
  const GetSavedMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
