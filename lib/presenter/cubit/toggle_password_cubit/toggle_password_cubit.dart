import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_password_state.dart';

class TogglePasswordCubit extends Cubit<bool> {
  TogglePasswordCubit() : super(true);

  void togglePassword() {
    emit(!state);
  }
}
