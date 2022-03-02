import 'package:elter/entity/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> itemlar = {};

  Map<String, CartItem> get items {
    return {...itemlar};
  }

  int get itemCount {
    return itemlar.length;
  }

  int get totalCartItem {
    var total = 0;
    itemlar.forEach((key, cartItem) {
      total += cartItem.quantity!;
    });
    return total;
  }

  double get totalAmount {
    var total = 0.0;
    itemlar.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addItem(
    // int orderId,
    String productId,
    double price,
    int quantity,
    int counter,
    String title,
    String imgUrl,
    String userPhone,
    // String userEmail,
    String userName,
    Set colorList,
    Set sizeList,
    Set quantityList,
  ) {
    if (!itemlar.containsKey(productId)) {
      itemlar.putIfAbsent(
        productId,
        () => CartItem(
            // orderId: orderId,
            id: productId,
            title: title,
            price: price,
            quantity: quantity,
            imgUrl: imgUrl,
            userPhone: userPhone,
            // userEmail: userEmail,
            userName: userName,
            colorList: colorList,
            sizeList: sizeList,
            quantityList: quantityList),
      );
    } else {
      // change quantity...

      itemlar['$productId + $counter'] = CartItem(
          // orderId: orderId,
          id: productId,
          title: title,
          price: price,
          quantity: quantity,
          imgUrl: imgUrl,
          userPhone: userPhone,
          // userEmail: userEmail,
          userName: userName,
          colorList: colorList,
          sizeList: sizeList,
          quantityList: quantityList);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    itemlar.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!itemlar.containsKey(productId)) {
      return;
    }
    if (itemlar[productId]!.quantity! > 1) {
      itemlar.update(
          productId,
          (existingCartItem) => CartItem(
              // orderId: existingCartItem.orderId,
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity! - 1,
              imgUrl: existingCartItem.imgUrl,
              userPhone: existingCartItem.userPhone,
              userName: existingCartItem.userName,
              sizeList: existingCartItem.sizeList,
              colorList: existingCartItem.colorList,
              quantityList: existingCartItem.quantityList));
    } else {
      itemlar.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    itemlar = {};
    notifyListeners();
  }
}
