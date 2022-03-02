import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_home_screens_state.dart';

class ChangeHomeScreensCubit extends Cubit<ChangeHomeScreensState> {
  ChangeHomeScreensCubit() : super(ChangeHomeScreensInitial());

  void changeHomeScreen(int screenIndex) {
    emit(HomeScreenChanged(screenIndex));
  }
}
