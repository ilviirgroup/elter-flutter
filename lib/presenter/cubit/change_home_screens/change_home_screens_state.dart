part of 'change_home_screens_cubit.dart';

abstract class ChangeHomeScreensState extends Equatable {
  const ChangeHomeScreensState();

  @override
  List<Object> get props => [];
}

class ChangeHomeScreensInitial extends ChangeHomeScreensState {}

class HomeScreenChanged extends ChangeHomeScreensState {
  final int screenIndex;
 const HomeScreenChanged(this.screenIndex);

   @override
  List<Object> get props => [screenIndex];

}
