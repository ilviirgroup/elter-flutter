part of 'search_tapped_cubit.dart';

abstract class SearchTappedState extends Equatable {
  const SearchTappedState();

  @override
  List<Object> get props => [];
}

class SearchTappedInitial extends SearchTappedState {}

class SearchTappedSuccess extends SearchTappedState {
  final bool searchTapped;
  const SearchTappedSuccess(this.searchTapped);

  @override
  List<Object> get props => [searchTapped];
}
