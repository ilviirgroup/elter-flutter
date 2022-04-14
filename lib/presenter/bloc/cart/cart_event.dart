part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartLoadedEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartInitializedEvent extends CartEvent{
   @override
  List<Object> get props => [];
}

class CartAddedEvent extends CartEvent {
  final Product cartItem;

  const CartAddedEvent(this.cartItem);
  @override
  List<Object> get props => [cartItem];
}

class CartRemovedEvent extends CartEvent {
  final String productId;
  final String productName;

  const CartRemovedEvent(this.productId, this.productName);
  @override
  List<Object> get props => [productId, productName];
}
