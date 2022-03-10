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
  bool? isNew;
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
    this.isNew,
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
        barcode: json[ApiFields.barcode] ?? '',
        brand: json[ApiFields.brand],
        category: json[ApiFields.category],
        color: json[ApiFields.color],
        date: json[ApiFields.date],
        description: json[ApiFields.description],
        discountAmount: json[ApiFields.discountAmount],
        discountPercentage: json[ApiFields.discountPercentage],
        gender: json[ApiFields.gender],
        isNew: json[ApiFields.isNew],
        location: json[ApiFields.location],
        name: json[ApiFields.name],
        newPrice: json[ApiFields.newPrice],
        photo1: json[ApiFields.photo1] ?? 'Surat ýok',
        photo2: json[ApiFields.photo2],
        photo3: json[ApiFields.photo3],
        photo4: json[ApiFields.photo4],
        pk: json[ApiFields.pk],
        price: json[ApiFields.price],
        productId: json[ApiFields.productId],
        vendorName: json[ApiFields.vendorName],
        size: json[ApiFields.size],
        subCategory: json[ApiFields.subCategory],
        superCategory: json[ApiFields.superCategory],
        url: json[ApiFields.url],
        visited: json[ApiFields.visited],
      );
}

class ApiFields {
  static const barcode = "barcode";
  static const brand = "brand";
  static const category = "category";
  static const color = "color";
  static const date = "date";
  static const description = "description";
  static const discountAmount = "discounted_price";
  static const discountPercentage = "discount";
  static const gender = "gender";
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
