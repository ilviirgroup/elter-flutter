import 'package:hive_flutter/hive_flutter.dart';

import '../models.dart';

class CartRepository {
  late Box<Product> _cartItems;

  Future<void> init() async {
    Hive.registerAdapter(ProductAdapter());
    // await Hive.openBox<Product>('cartItemsBox');
    // await Hive.deleteBoxFromDisk('cartItemsBox');
    _cartItems = await Hive.openBox<Product>('cartItemsBox');
  }

  List<Product> getCartItems() {
    return _cartItems.values.toList();
  }

  Future<double> getTotalAmount() async {
    double totalAmount = 0;
    for (var item in getCartItems()) {
      totalAmount += (item.selectedQuantity! * item.newPrice!);
    }
    return totalAmount;
  }

  Future<double> freeDeliveryProductsPrice() async {
    double totalAmount = 0;
    for (var item in getCartItems()) {
      if (item.freeDelivery!) {
        totalAmount += (item.selectedQuantity! * item.newPrice!);
      }
    }
    return totalAmount;
  }

  bool isDeliveryFree() {
    double _price = 0.0;
    double freeDeliveryPrice = 100.0;
    for (var item in getCartItems()) {
      if (item.freeDelivery!) {
        _price += (item.selectedQuantity! * item.newPrice!);
      }
    }
    if (_price >= freeDeliveryPrice) {
      return true;
    }
    return false;
  }

  Future<int> totalCartItems() async {
    int totalCartItems = 0;
    for (var item in getCartItems()) {
      totalCartItems += item.selectedQuantity!;
    }
    return totalCartItems;
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
    final bool increment,
  ) async {
    final cartItemToEdit = _cartItems.values.firstWhere((element) =>
        element.productId == productId && element.name == productName);
    final index = cartItemToEdit.key as int;
    cartItemToEdit.selectedQuantity ??= 1;
    if (increment) {
      await _cartItems.put(
          index,
          cartItemToEdit
            ..selectedQuantity = cartItemToEdit.selectedQuantity! + 1);
    }
    if (!increment && cartItemToEdit.selectedQuantity! > 1) {
      await _cartItems.put(
          index,
          cartItemToEdit
            ..selectedQuantity = cartItemToEdit.selectedQuantity! - 1);
    }
  }
}
