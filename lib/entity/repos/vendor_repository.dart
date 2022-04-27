import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class VendorRepository {
  final NetworkService networkService;
  VendorRepository(this.networkService);

  Future<List<Vendor>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.vendorApiRoute);
    return rawData.map((json) => Vendor.fromJson(json)).toList();
  }
}
