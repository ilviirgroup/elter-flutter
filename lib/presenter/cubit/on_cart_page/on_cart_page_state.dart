part of 'on_cart_page_cubit.dart';

abstract class OnCartPageState extends Equatable {
  const OnCartPageState();

  @override
  List<Object> get props => [];
}

class OnCartPageInitial extends OnCartPageState {}

class OnCartPageLoaded extends OnCartPageState {
  final Function cartPage;
  const OnCartPageLoaded(this.cartPage);

  @override
  List<Object> get props => [cartPage];
}
