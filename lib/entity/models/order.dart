class Order {
  final int? pk;
  final String? address;
  final String? orderId;
  final List? color;
  final bool completed;
  final String? date;
  final bool onProcess;
  final String? photo;
  final double? price;
  final String productName;
  final double quantity;
  final double? result;
  final List? size;
  final String? url;
  final String? userName;
  final String userPhone;

  Order({
    this.pk,
    required this.address,
    this.orderId,
    this.color,
    required this.completed,
    this.date,
    required this.onProcess,
    this.photo,
    required this.price,
    required this.productName,
    required this.quantity,
    this.result,
    this.size,
    this.url,
    required this.userName,
    required this.userPhone,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        address: json[OrderApiFields.address],
        orderId: json[OrderApiFields.orderId],
        color: json[OrderApiFields.color],
        completed: json[OrderApiFields.completed],
        date: json[OrderApiFields.date],
        onProcess: json[OrderApiFields.onProcess],
        photo: json[OrderApiFields.photo] ?? 'No Photo',
        pk: json[OrderApiFields.pk],
        price: json[OrderApiFields.price],
        productName: json[OrderApiFields.productName],
        quantity: json[OrderApiFields.quantity],
        result: json[OrderApiFields.result],
        size: json[OrderApiFields.size],
        url: json[OrderApiFields.url],
        userName: json[OrderApiFields.userName],
        userPhone: json[OrderApiFields.userPhone],
      );

  Map<String, dynamic> toJson() => {
        OrderApiFields.address: address,
        OrderApiFields.color: color,
        OrderApiFields.completed: completed,
        OrderApiFields.onProcess: onProcess,
        OrderApiFields.orderId: orderId,
        // OrderApiFields.photo: photo,
        OrderApiFields.price: price,
        OrderApiFields.productName: productName,
        OrderApiFields.quantity: quantity,
        OrderApiFields.size: size,
        OrderApiFields.userName: userName,
        OrderApiFields.userPhone: userPhone,
      };
}

class OrderApiFields {
  static const pk = 'pk';
  static const orderId = 'ai';
  static const productName = 'name_order';
  static const address = 'adress';
  static const userName = 'user_name';
  static const userEmail = 'user_email';
  static const userPhone = 'user_phone';
  static const completed = 'completed';
  static const onProcess = 'in_process';
  static const color = 'color';
  static const size = 'size';
  static const date = 'date';
  static const price = 'price_order';
  static const quantity = 'quantity';
  static const result = 'result';
  static const photo = 'photo';
  static const url = 'url';
}
