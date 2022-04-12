import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_cart_page_state.dart';

class OnCartPageCubit extends Cubit<OnCartPageState> {
  OnCartPageCubit() : super(OnCartPageInitial());

  void toCartPage(Function cartPage) {
    emit(
      OnCartPageLoaded(cartPage),
    );
  }
}
