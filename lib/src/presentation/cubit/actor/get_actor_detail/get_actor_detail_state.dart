part of 'get_actor_detail_cubit.dart';

sealed class GetActorDetailState extends Equatable {
  const GetActorDetailState();

  @override
  List<Object> get props => [];
}

final class GetActorDetailInitial extends GetActorDetailState {}

final class GetActorDetailLoading extends GetActorDetailState {
  const GetActorDetailLoading();
}

final class GetActorDetailLoaded extends GetActorDetailState {
  const GetActorDetailLoaded({required this.actor});

  final ActorDetailEntity actor;

  @override
  List<Object> get props => [actor];
}

final class GetActorDetailError extends GetActorDetailState {
  const GetActorDetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
