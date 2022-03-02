class Size {
  String name;
  int pk;
  List? products;
  String? url;

  Size({
    required this.name,
    required this.pk,
    this.products,
    this.url,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        name: json[SizeApiFields.name],
        pk: json[SizeApiFields.pk],
        url: json[SizeApiFields.url],
      );
}

class SizeApiFields {
  static const name = "name";
  static const pk = "pk";
  static const products = "products";
  static const url = "url";
}
