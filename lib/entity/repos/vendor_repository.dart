import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class SellerRepository {
  final NetworkService networkService;
  SellerRepository(this.networkService);

  Future<List<Seller>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.vendorApiRoute);
    return rawData.map((json) => Seller.fromJson(json)).toList();
  }
}
