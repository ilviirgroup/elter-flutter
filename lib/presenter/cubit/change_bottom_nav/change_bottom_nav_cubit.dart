import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_bottom_nav_state.dart';

class ChangeBottomNavCubit extends Cubit<ChangeBottomNavState> {
  ChangeBottomNavCubit() : super(ChangeBottomNavInitial());

  void changeIndex(int index) {
    emit(ChangeBottomNavChanged(index));
  }
}
