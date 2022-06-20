import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product extends HiveObject {
  @HiveField(0)
  int pk;
  @HiveField(1)
  String? barcode;
  @HiveField(2)
  String? brand;
  @HiveField(3)
  String category;
  @HiveField(4)
  String? color;
  @HiveField(5)
  String date;
  @HiveField(6)
  String? description;
  @HiveField(7)
  double? discountAmount;
  @HiveField(8)
  double? discountPercentage;
  @HiveField(9)
  String? gender;
  @HiveField(10)
  bool isNew;
  @HiveField(11)
  bool isSale;
  @HiveField(12)
  String location;
  @HiveField(13)
  String name;
  @HiveField(14)
  double? newPrice;
  @HiveField(15)
  String? photo1;
  @HiveField(16)
  String? photo2;
  @HiveField(17)
  String? photo3;
  @HiveField(18)
  String? photo4;
  @HiveField(19)
  double price;
  @HiveField(20)
  String productId;
  @HiveField(21)
  String vendorName;
  @HiveField(22)
  String? size;
  @HiveField(23)
  String subCategory;
  @HiveField(24)
  String superCategory;
  @HiveField(25)
  String? url;
  @HiveField(26)
  int visited;
  @HiveField(29, defaultValue: false)
  bool? freeDelivery;
  @HiveField(27)
  int? selectedQuantity;

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
    this.freeDelivery = false,
    this.selectedQuantity = 1,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        barcode: json[ProductApiFields.barcode] ?? '',
        brand: json[ProductApiFields.brand],
        category: json[ProductApiFields.category],
        color: json[ProductApiFields.color],
        date: json[ProductApiFields.date],
        description: json[ProductApiFields.description] ?? '',
        discountAmount: json[ProductApiFields.discountAmount],
        discountPercentage: json[ProductApiFields.discountPercentage],
        freeDelivery: json[ProductApiFields.freeDelivery],
        gender: json[ProductApiFields.gender],
        isSale: json[ProductApiFields.isSale],
        isNew: json[ProductApiFields.isNew],
        location: json[ProductApiFields.location],
        name: json[ProductApiFields.name],
        newPrice: json[ProductApiFields.newPrice],
        photo1: json[ProductApiFields.photo1] ?? '',
        photo2: json[ProductApiFields.photo2] ?? '',
        photo3: json[ProductApiFields.photo3] ?? '',
        photo4: json[ProductApiFields.photo4] ?? '',
        pk: json[ProductApiFields.pk],
        price: json[ProductApiFields.price],
        productId: json[ProductApiFields.productId] ?? '',
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
  static const freeDelivery = "free_delivery";
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
  static const productId = "product_id";
  static const vendorName = "vendor_name";
  static const size = "size";
  static const subCategory = "subcategory";
  static const superCategory = "supercategory";
  static const url = "url";
  static const visited = "visited";
}
