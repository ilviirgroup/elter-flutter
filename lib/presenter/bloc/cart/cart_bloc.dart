import 'package:bloc/bloc.dart';
import 'package:elter/entity/models/product.dart';
import 'package:elter/entity/repos.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository;
  CartBloc(this._repository) : super(RegisterRepositoryState()) {
    on<CartLoadedEvent>((event, emit) async {
      final cartItems = _repository.getCartItems();
      emit(CartLoadedState(cartItems));
    });

    on<CartAddedEvent>((event, emit) async {
      _repository.addCartItems(event.cartItem);
      add(CartLoadedEvent());
    });

    on<CartRemovedEvent>((event, emit) async {
      _repository.removeCartItem(event.productId, event.productName);
      add(CartLoadedEvent());
    });

    on<CartInitializedEvent>((event, emit) async {
      await _repository.init();
      emit(CartInitial());
    });
  }
}
