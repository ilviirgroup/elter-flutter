part of 'visited_cubit.dart';

abstract class VisitedState extends Equatable {
  const VisitedState();

  @override
  List<Object> get props => [];
}

class VisitedInitial extends VisitedState {}

class VisitedLoaded extends VisitedState {
  final Visited visited;
  VisitedLoaded(this.visited);

    @override
  List<Object> get props => [];
}
