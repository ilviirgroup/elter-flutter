part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class RegisterRepositoryState extends CartState {}

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
