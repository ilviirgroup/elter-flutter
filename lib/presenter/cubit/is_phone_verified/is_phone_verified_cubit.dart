import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_phone_verified_state.dart';

class IsPhoneVerifiedCubit extends Cubit<bool> {
  IsPhoneVerifiedCubit() : super(false);

  void isPhoneVerified() {
    emit(!state);
  }
}
