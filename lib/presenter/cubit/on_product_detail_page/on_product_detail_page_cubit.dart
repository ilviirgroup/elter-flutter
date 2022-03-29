import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_product_detail_page_state.dart';

class OnProductDetailPageCubit extends Cubit<OnProductDetailPageState> {
  OnProductDetailPageCubit() : super(OnProductDetailPageInitial());

  void onNextPage(Function onNext) {
    emit(
      OnProductDetailPageLoaded(onNext),
    );
  }
}
