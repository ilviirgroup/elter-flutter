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
  final double totalAmount;
  final int totalCartItems;
  final bool isDeliveryFree;
  final double freeDeliveryProductsPrice;

  const CartLoadedState(this.cartItems, this.totalAmount, this.totalCartItems,
      this.isDeliveryFree, this.freeDeliveryProductsPrice);

  @override
  List<Object> get props => [cartItems, totalAmount, totalCartItems];
}

class RegisterRepositoryState extends CartState {
  @override
  List<Object> get props => [];
}
