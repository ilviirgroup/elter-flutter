class Color {
  int pk;
  String name;
  List? products;
  String? url;

  Color({
    required this.pk,
    required this.name,
    this.products,
    this.url,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
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
