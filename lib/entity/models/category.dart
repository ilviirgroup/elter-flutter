class Category {
  int pk;
  // String categoryId;
  String name;
  String? photo;
  String superCategory;
  List? products;
  List? subCategory;
  String? url;

  Category({
    required this.pk,
    // required this.categoryId,
    required this.name,
    this.photo,
    required this.superCategory,
    this.products,
    this.subCategory,
    this.url,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        pk: json[CategoryApiFields.pk],
        name: json[CategoryApiFields.name],
        superCategory: json[CategoryApiFields.superCategory],
      )
        ..photo = json[CategoryApiFields.photo]
        ..products = json[CategoryApiFields.products]
        ..subCategory = json[CategoryApiFields.subCategory]
        ..url = json[CategoryApiFields.url];
}

class CategoryApiFields {
  static const pk = "pk";
  // static const categoryId = "ai";
  static const name = "name";
  static const photo = "photo";
  static const products = "products";
  static const subCategory = "subcategory";
  static const superCategory = "super";
  static const url = "url";
}
