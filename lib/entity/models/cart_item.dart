class CartItem {
  // final int orderId;
  final String? id;
  final String? userPhone;
  // final String? userEmail;
  final String? userName;
  final String? title;
  final int? quantity;
  final double? price;
  final String? imgUrl;
  final Set? colorList;
  final Set? sizeList;
  final Set? quantityList;

  CartItem({
    // @required this.orderId,
    required this.id,
    required this.userPhone,
    // @required this.userEmail,
    required this.userName,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imgUrl,
    required this.colorList,
    required this.sizeList,
    required this.quantityList,
  });
}
