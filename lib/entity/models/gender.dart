class Gender {
  final int pk;
  final String name;
  final List? products;
  final String? url;

  Gender({
    required this.pk,
    required this.name,
    this.products,
    this.url,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        name: json[GenderApiFields.name],
        pk: json[GenderApiFields.pk],
        products: json[GenderApiFields.products],
        url: json[GenderApiFields.url],
      );
}

class GenderApiFields {
  static String name = 'name';
  static String pk = 'pk';
  static String products = 'products';
  static String url = 'url';
}
