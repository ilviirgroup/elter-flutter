import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_sign_in_page_state.dart';

class OnSignInPageCubit extends Cubit<OnSignInPageState> {
  OnSignInPageCubit() : super(OnSignInPageInitial());

  void toSignInPage(Function signInPage) {
    emit(OnSignInPageLoaded(signInPage));
  }
}
