import 'package:bloc/bloc.dart';
import 'package:elter/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'change_bottom_nav_state.dart';

class ChangeBottomNavCubit extends Cubit<BottomNavScreen> {
  ChangeBottomNavCubit() : super(BottomNavScreen.home);

  void changeBottomNavIndex(BottomNavScreen screen) {
    emit(screen);
  }
}
