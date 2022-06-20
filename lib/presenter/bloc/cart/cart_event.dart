part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitializedEvent extends CartEvent {}

class CartLoadedEvent extends CartEvent {}

class CartEmptiedEvent extends CartEvent {}

class CartAddedEvent extends CartEvent {
  final Product cartItem;

  const CartAddedEvent(this.cartItem);
  @override
  List<Object> get props => [cartItem];
}

class CartRemovedEvent extends CartEvent {
  final String productId;
  final String productName;

  const CartRemovedEvent(
    this.productId,
    this.productName,
  );

  @override
  List<Object> get props => [productId, productName];
}

class CartUpdatedEvent extends CartEvent {
  const CartUpdatedEvent(
    this.productId,
    this.productName,
    this.increment,
  );

  final String productId;
  final String productName;
  final bool increment;

  @override
  List<Object> get props => [productId, productName];
}
