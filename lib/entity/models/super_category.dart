class SuperCategory {
  final int pk;
  final List? category;
  final String name;
  final String photo;
  final List? products;
  final String? url;

  SuperCategory({
    required this.pk,
    this.category,
    required this.name,
    required this.photo,
    this.products,
    this.url,
  });

  factory SuperCategory.fromJson(Map<String, dynamic> json) => SuperCategory(
        pk: json[SuperCategoryApiFields.pk],
        category: json[SuperCategoryApiFields.category],
        name: json[SuperCategoryApiFields.name],
        photo: json[SuperCategoryApiFields.photo],
        products: json[SuperCategoryApiFields.products],
        url: json[SuperCategoryApiFields.url],
      );
}

class SuperCategoryApiFields {
  static const pk = 'pk';
  static const category = 'category';
  static const name = 'name';
  static const photo = 'photo';
  static const products = 'products';
  static const url = 'url';
}
