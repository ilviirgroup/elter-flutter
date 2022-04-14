part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final List<Product> cartItems;

  const CartLoadedState(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class RegisterRepositoryState extends CartState {
  @override
  List<Object> get props => [];
}
