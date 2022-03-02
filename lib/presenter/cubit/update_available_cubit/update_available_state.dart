part of 'update_available_cubit.dart';

@immutable
abstract class UpdateAvailableState extends Equatable{
  const UpdateAvailableState();

  @override
  List<Object> get props => [];
}

class UpdateAvailableInitial extends UpdateAvailableState {}

class UpdateFetchSuccess extends UpdateAvailableState {
  final Update isUpdated;
  const UpdateFetchSuccess({required this.isUpdated});

  @override
  List<Object> get props => [isUpdated];
}
