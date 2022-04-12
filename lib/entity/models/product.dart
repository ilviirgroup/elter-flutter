class Product {
  int pk;
  String? barcode;
  String? brand;
  String category;
  String? color;
  String date;
  String? description;
  double? discountAmount;
  double? discountPercentage;
  String? gender;
  bool isNew;
  bool isSale;
  String location;
  String name;
  double? newPrice;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  double price;
  String productId;
  String vendorName;
  String? size;
  String subCategory;
  String superCategory;
  String? url;
  int visited;

  Product({
    this.barcode,
    this.brand,
    required this.category,
    this.color,
    required this.date,
    this.description,
    this.discountAmount,
    this.discountPercentage,
    this.gender,
    required this.isSale,
    required this.isNew,
    required this.location,
    required this.name,
    this.newPrice,
    this.photo1,
    this.photo2,
    this.photo3,
    this.photo4,
    required this.pk,
    required this.price,
    required this.productId,
    required this.vendorName,
    this.size,
    required this.subCategory,
    required this.superCategory,
    required this.url,
    required this.visited,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        barcode: json[ProductApiFields.barcode] ?? '',
        brand: json[ProductApiFields.brand],
        category: json[ProductApiFields.category],
        color: json[ProductApiFields.color],
        date: json[ProductApiFields.date],
        description: json[ProductApiFields.description],
        discountAmount: json[ProductApiFields.discountAmount],
        discountPercentage: json[ProductApiFields.discountPercentage],
        gender: json[ProductApiFields.gender],
        isSale: json[ProductApiFields.isSale],
        isNew: json[ProductApiFields.isNew],
        location: json[ProductApiFields.location],
        name: json[ProductApiFields.name],
        newPrice: json[ProductApiFields.newPrice],
        photo1: json[ProductApiFields.photo1] ?? 'Surat ýok',
        photo2: json[ProductApiFields.photo2],
        photo3: json[ProductApiFields.photo3],
        photo4: json[ProductApiFields.photo4],
        pk: json[ProductApiFields.pk],
        price: json[ProductApiFields.price],
        productId: json[ProductApiFields.productId],
        vendorName: json[ProductApiFields.vendorName],
        size: json[ProductApiFields.size],
        subCategory: json[ProductApiFields.subCategory],
        superCategory: json[ProductApiFields.superCategory],
        url: json[ProductApiFields.url],
        visited: json[ProductApiFields.visited],
      );
}

class ProductApiFields {
  static const barcode = "barcode";
  static const brand = "brand";
  static const category = "category";
  static const color = "color";
  static const date = "date";
  static const description = "description";
  static const discountAmount = "discounted_price";
  static const discountPercentage = "discount";
  static const gender = "gender";
  static const isSale = "calc_discount";
  static const isNew = "new";
  static const location = "location";
  static const name = "name";
  static const newPrice = "new_price";
  static const photo1 = "photo1";
  static const photo2 = "photo2";
  static const photo3 = "photo3";
  static const photo4 = "photo4";
  static const pk = "pk";
  static const price = "price";
  static const productId = "ai";
  static const vendorName = "vendor_name";
  static const size = "size";
  static const subCategory = "subcategory";
  static const superCategory = "supercategory";
  static const url = "url";
  static const visited = "visited";
}
