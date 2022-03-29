part of 'on_product_detail_page_cubit.dart';

abstract class OnProductDetailPageState extends Equatable {
  const OnProductDetailPageState();

  @override
  List<Object> get props => [];
}

class OnProductDetailPageInitial extends OnProductDetailPageState {}

class OnProductDetailPageLoaded extends OnProductDetailPageState {
  final Function onNext;
  const OnProductDetailPageLoaded(this.onNext);

  @override
  List<Object> get props => [onNext];
}
