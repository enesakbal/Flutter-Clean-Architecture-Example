part of 'get_popular_movies_cubit.dart';

sealed class GetPopularMoviesState extends Equatable {
  const GetPopularMoviesState();

  @override
  List<Object> get props => [];
}

final class GetPopularMoviesInitial extends GetPopularMoviesState {}

final class GetPopularMoviesLoading extends GetPopularMoviesState {
  const GetPopularMoviesLoading();
}

final class GetPopularMoviesLoaded extends GetPopularMoviesState {
  const GetPopularMoviesLoaded({required this.movies});

  final List<MovieDetailEntity> movies;

  @override
  List<Object> get props => [movies];
}

final class GetPopularMoviesError extends GetPopularMoviesState {
  const GetPopularMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
