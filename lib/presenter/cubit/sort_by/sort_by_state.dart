part of 'sort_by_cubit.dart';

abstract class SortByState extends Equatable {
  const SortByState();

  @override
  List<Object> get props => [];
}

class SortByInitial extends SortByState {}

class SortByCalled extends SortByState {
  final String sortBy;
  const SortByCalled(this.sortBy);

  @override
  List<Object> get props => [sortBy];
}
