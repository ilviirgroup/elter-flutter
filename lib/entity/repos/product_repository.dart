import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/product.dart';

class ProductRepository {
  final NetworkService networkService;
  ProductRepository(this.networkService);

  Future<List<Product>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.productApiRoute);
    return rawData.map((json) => Product.fromJson(json)).toList();
  }
}
