class Order {
  final int pk;
  final String? address;
  final String ai;
  final String? color;
  final bool completed;
  final String date;
  final bool inProcess;
  final String? photo;
  final double price;
  final String productName;
  final double quantity;
  final double? result;
  final String? size;
  final String url;
  final String? userName;
  final String userPhone;

  Order({
    required this.pk,
    this.address,
    required this.ai,
    this.color,
    required this.completed,
    required this.date,
    required this.inProcess,
    this.photo,
    required this.price,
    required this.productName,
    required this.quantity,
    this.result,
    this.size,
    required this.url,
    this.userName,
    required this.userPhone,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        address: json[OrderApiFields.address],
        ai: json[OrderApiFields.ai],
        color: json[OrderApiFields.color],
        completed: json[OrderApiFields.completed],
        date: json[OrderApiFields.date],
        inProcess: json[OrderApiFields.inProcess],
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
}

class OrderApiFields {
  static const pk = 'pk';
  static const ai = 'ai';
  static const productName = 'name_order';
  static const address = 'adress';
  static const userName = 'user_name';
  static const userEmail = 'user_email';
  static const userPhone = 'user_phone';
  static const completed = 'completed';
  static const inProcess = 'in_process';
  static const color = 'color';
  static const size = 'size';
  static const date = 'date';
  static const price = 'price_order';
  static const quantity = 'quantity';
  static const result = 'result';
  static const photo = 'photo';
  static const url = 'url';
}
