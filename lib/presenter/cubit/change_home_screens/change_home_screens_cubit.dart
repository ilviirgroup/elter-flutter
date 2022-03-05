import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_home_screens_state.dart';

class ChangeHomeScreensCubit extends Cubit<int> {
  ChangeHomeScreensCubit() : super(0);

  void changeHomeScreen(int screenIndex) {
    emit(screenIndex);
  }
}
