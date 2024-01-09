part of 'get_movie_credits_cubit.dart';

sealed class GetMovieCreditsState extends Equatable {
  const GetMovieCreditsState();

  @override
  List<Object> get props => [];
}

final class GetMovieCreditsInitial extends GetMovieCreditsState {
  const GetMovieCreditsInitial();
}

final class GetMovieCreditsLoading extends GetMovieCreditsState {
  const GetMovieCreditsLoading();
}

final class GetMovieCreditsLoaded extends GetMovieCreditsState {
  const GetMovieCreditsLoaded(this.movieCreditEntity);

  final MovieCreditEntity movieCreditEntity;

  @override
  List<Object> get props => [movieCreditEntity];
}

final class GetMovieCreditsError extends GetMovieCreditsState {
  const GetMovieCreditsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
