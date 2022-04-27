import 'package:bloc/bloc.dart';
import '../../../entity/models/product.dart';
import '../../../entity/repos.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository;
  CartBloc(this._repository) : super(RegisterRepositoryState()) {
    
    on<CartInitializedEvent>((event, emit) async {
      await _repository.init();
      emit(CartInitial());
    });
    
    on<CartLoadedEvent>((event, emit) async {
      final cartItems = _repository.getCartItems();
      final totalAmount = await _repository.getTotalAmount();
      final totalCartItems = await _repository.totalCartItems();
      final isDeliveryFree = _repository.isDeliveryFree();
      final freeDeliveryProductsPrice =
          await _repository.freeDeliveryProductsPrice();
      emit(CartLoadedState(
          cartItems, totalAmount, totalCartItems, isDeliveryFree, freeDeliveryProductsPrice));
    });

    on<CartAddedEvent>((event, emit) async {
      _repository.addCartItems(event.cartItem);
      add(CartLoadedEvent());
    });

    on<CartRemovedEvent>((event, emit) async {
      _repository.removeCartItem(event.productId, event.productName);
      add(CartLoadedEvent());
    });


    on<CartUpdatedEvent>((event, emit) async {
      await _repository.updateCartItem(
          event.productId, event.productName, event.increment);
      add(CartLoadedEvent());
    });
  }
}
