class Order {
  final int? pk;
  final String? address;
  final bool cancelled;
  final String? color;
  final bool completed;
  final String? date;
  final bool onProcess;
  final String? orderId;
  final String? orderNote;
  final String? photo;
  final double price;
  final String productName;
  final double quantity;
  final double? result;
  final String? size;
  final String? userEmail;
  final String? userName;
  final String userPhone;
  final String? url;
  final String vendorName;

  Order({
    this.pk,
    required this.address,
    required this.cancelled,
    this.color,
    required this.completed,
    this.date,
    required this.onProcess,
    this.orderId,
    this.orderNote,
    this.photo,
    required this.price,
    required this.productName,
    required this.quantity,
    this.result,
    this.size,
    this.userEmail,
    required this.userName,
    required this.userPhone,
    this.url,
    required this.vendorName,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        pk: json[OrderApiFields.pk],
        address: json[OrderApiFields.address],
        cancelled: json[OrderApiFields.cancelled],
        color: json[OrderApiFields.color],
        completed: json[OrderApiFields.completed],
        date: json[OrderApiFields.date],
        onProcess: json[OrderApiFields.onProcess],
        orderId: json[OrderApiFields.orderId],
        orderNote: json[OrderApiFields.orderNote] ?? '',
        photo: json[OrderApiFields.photo] ?? 'No Photo',
        price: json[OrderApiFields.price],
        productName: json[OrderApiFields.productName],
        quantity: json[OrderApiFields.quantity],
        result: json[OrderApiFields.result],
        size: json[OrderApiFields.size],
        userEmail: json[OrderApiFields.userEmail] ?? '',
        userName: json[OrderApiFields.userName],
        userPhone: json[OrderApiFields.userPhone],
        url: json[OrderApiFields.url],
        vendorName: json[OrderApiFields.vendorName] ?? '',
      );

  Map<String, dynamic> toJson() => {
        OrderApiFields.address: address,
        OrderApiFields.cancelled: cancelled,
        OrderApiFields.color: color,
        OrderApiFields.completed: completed,
        OrderApiFields.onProcess: onProcess,
        OrderApiFields.orderId: orderId,
        OrderApiFields.orderNote: orderNote,
        OrderApiFields.photo: photo,
        OrderApiFields.price: price,
        OrderApiFields.productName: productName,
        OrderApiFields.quantity: quantity,
        OrderApiFields.size: size,
        OrderApiFields.userName: userName,
        OrderApiFields.userPhone: userPhone,
        OrderApiFields.vendorName: vendorName,
      };
}

class OrderApiFields {
  static const pk = 'pk';
  static const address = 'adress';
  static const cancelled = 'cancelled';
  static const color = 'color';
  static const completed = 'completed';
  static const date = 'date';
  static const orderId = 'order_id';
  static const onProcess = 'in_process';
  static const orderNote = 'order_note';
  static const photo = 'photo';
  static const price = 'price_order';
  static const productName = 'name_order';
  static const quantity = 'quantity';
  static const result = 'result';
  static const size = 'size';
  static const userEmail = 'user_email';
  static const userName = 'user_name';
  static const userPhone = 'user_phone';
  static const url = 'url';
  static const vendorName = 'vendor_name';
}
