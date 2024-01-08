part of 'get_top_rated_movies_cubit.dart';

sealed class GetTopRatedMoviesState extends Equatable {
  const GetTopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class GetTopRatedMoviesInitial extends GetTopRatedMoviesState {}

final class GetTopRatedMoviesLoading extends GetTopRatedMoviesState {
  const GetTopRatedMoviesLoading();
}

final class GetTopRatedMoviesLoaded extends GetTopRatedMoviesState {
  const GetTopRatedMoviesLoaded({required this.movies});

  final List<MovieDetailEntity> movies;

  @override
  List<Object> get props => [movies];
}

final class GetTopRatedMoviesError extends GetTopRatedMoviesState {
  const GetTopRatedMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
