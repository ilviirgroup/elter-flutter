class SubCategory {
  final String category;
  final String name;
  final String? photo;
  final int pk;
  final List? products;
  final String? url;

  SubCategory({
    required this.category,
    required this.name,
    this.photo,
    required this.pk,
    this.products,
    this.url,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        category: json[SubCategoryApiFields.category],
        name: json[SubCategoryApiFields.name],
        photo: json[SubCategoryApiFields.photo],
        pk: json[SubCategoryApiFields.pk],
        products: json[SubCategoryApiFields.products],
        url: json[SubCategoryApiFields.url],
      );
}

class SubCategoryApiFields {
  static const category = 'category';
  static const name = 'name';
  static const photo = 'photo';
  static const pk = 'pk';
  static const products = 'products';
  static const url = 'url';
}
