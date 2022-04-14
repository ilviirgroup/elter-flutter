class ColorObject {
  int pk;
  String name;
  List? products;
  String? url;

  ColorObject({
    required this.pk,
    required this.name,
    this.products,
    this.url,
  });

  factory ColorObject.fromJson(Map<String, dynamic> json) => ColorObject(
        name: json[ColorApiFields.name],
        pk: json[ColorApiFields.pk],
        url: json[ColorApiFields.url],
      );
}

class ColorApiFields {
  static const pk = "pk";
  static const name = "name";
  static const products = 'products';
  static const url = "url";
}
