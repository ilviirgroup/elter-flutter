import 'package:bloc/bloc.dart';
import 'package:elter/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'change_home_screens_state.dart';

class ChangeHomeScreensCubit extends Cubit<HomeScreens> {
  ChangeHomeScreensCubit() : super(HomeScreens.adsList);

  void changeHomeScreen(HomeScreens screen) {
    emit(screen);
  }
}
