class Brand {
  int pk;
  String name;
  String? photo;
  List? products;
  String? url;

  Brand({
    required this.pk,
    required this.name,
    this.photo,
    this.products,
    this.url,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        pk: json[BrandApiFields.pk],
        name: json[BrandApiFields.name],
        photo: json[BrandApiFields.photo] ?? '',
        products: json[BrandApiFields.products],
        url: json[BrandApiFields.url],
      );

  Map<String, dynamic> toMap() {
    return {
      BrandApiFields.pk: pk,
      BrandApiFields.name: name,
    };
  }
}

class BrandApiFields {
  static const pk = "pk";
  static const name = "name";
  static const photo = "photo";
  static const products = "products";
  static const url = "url";
}
