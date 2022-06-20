import 'package:elter/entity/models/product.dart';

List<String> collectImages(Product product) {
  List<String> imageList = [];
  if (product.photo1 != null && product.photo1!.isNotEmpty) {
    imageList.add(product.photo1!);
  }
  if (product.photo2 != null && product.photo2!.isNotEmpty) {
    imageList.add(product.photo2!);
  }
  if (product.photo3 != null && product.photo3!.isNotEmpty) {
    imageList.add(product.photo3!);
  }
  if (product.photo4 != null && product.photo4!.isNotEmpty) {
    imageList.add(product.photo4!);
  }
  return imageList;
}
