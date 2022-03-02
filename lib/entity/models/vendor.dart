class Seller {
  int pk;
  String vendorName;
  List products;
  String url;

  Seller({
    required this.pk,
    required this.vendorName,
    required this.products,
    required this.url,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
      pk: json[SellerApiFields.pk],
      vendorName: json[SellerApiFields.vendorName],
      products: json[SellerApiFields.products],
      url: json[SellerApiFields.url]);
}

class SellerApiFields {
  static const pk = 'pk';
  static const vendorName = 'vendor_name';
  static const products = 'products';
  static const url = 'url';
}
