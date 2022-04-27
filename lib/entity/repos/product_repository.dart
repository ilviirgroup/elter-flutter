import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class ProductRepository {
  final NetworkService networkService;
  ProductRepository(this.networkService);

  Future<List<Product>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.productApiRoute);
    return rawData.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> fetchAdsProducts(String url) async {
    final List rawData = await networkService.getRequest.fetchData(url);
    return rawData.map((json) => Product.fromJson(json)).toList();
  }

  Future<Product> updateProduct(Map<String, dynamic> patchObj, int id) async {
    final updatedProduct = await networkService.updateRequest.patchData(
        patchObj: patchObj, id: id, apiRoute: ApiRoutes.productApiRoute);
    return Product.fromJson(updatedProduct);
  }
}
