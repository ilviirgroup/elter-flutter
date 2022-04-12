class Vendor {
  int pk;
  String vendorName;
  String photo;
  List products;
  String url;

  Vendor({
    required this.pk,
    required this.vendorName,
    required this.photo,
    required this.products,
    required this.url,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
      pk: json[VendorApiFields.pk],
      vendorName: json[VendorApiFields.vendorName],
      photo: json[VendorApiFields.photo] ?? '',
      products: json[VendorApiFields.products],
      url: json[VendorApiFields.url]);
}

class VendorApiFields {
  static const pk = 'pk';
  static const vendorName = 'vendor_name';
  static const photo = 'photo';
  static const products = 'products';
  static const url = 'url';
}
