part of 'change_bottom_nav_cubit.dart';

abstract class ChangeBottomNavState extends Equatable {
  const ChangeBottomNavState();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavInitial extends ChangeBottomNavState {}

class ChangeBottomNavChanged extends ChangeBottomNavState {
  final int index;
  const ChangeBottomNavChanged(this.index);

  @override
  List<Object> get props => [index];
}
