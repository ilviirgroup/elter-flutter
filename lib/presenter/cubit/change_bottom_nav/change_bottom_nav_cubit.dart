import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constants/app_enums.dart';

part 'change_bottom_nav_state.dart';

class ChangeBottomNavCubit extends Cubit<BottomNavScreen> {
  ChangeBottomNavCubit() : super(BottomNavScreen.home);

  void changeBottomNavIndex(BottomNavScreen screen) {
    emit(screen);
  }
}
