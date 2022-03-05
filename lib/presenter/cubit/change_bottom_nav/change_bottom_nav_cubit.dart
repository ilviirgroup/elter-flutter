import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_bottom_nav_state.dart';

class ChangeBottomNavCubit extends Cubit<int> {
  ChangeBottomNavCubit() : super(0);

  void changeBottomNavIndex(int index) {
    emit(index);
  }
}
