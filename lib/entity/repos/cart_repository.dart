import 'package:elter/entity/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartRepository {
  late Box<Product> _cartItems;
  
  Future<void> init() async {
    Hive.registerAdapter(ProductAdapter());
    _cartItems = await Hive.openBox<Product>('cartItemsBox');
  }

  List<Product> getCartItems() {
    return _cartItems.values.toList();
  }

  void addCartItems(final Product cartItem) {
    _cartItems.add(cartItem);
  }

  Future<void> removeCartItem(
    final String productId,
    final String productName,
  ) async {
    final cartItemToRemove = _cartItems.values.firstWhere((element) =>
        element.productId == productId && element.name == productName);
    await cartItemToRemove.delete();
  }

  Future<void> updateCartItem(
    final String productId,
    final String productName,
    final int quantity,
  ) async {
    final cartItemToEdit = _cartItems.values.firstWhere((element) =>
        element.productId == productId && element.name == productName);
    final index = cartItemToEdit.key as int;
    await _cartItems.put(index, cartItemToEdit);
  }
}
