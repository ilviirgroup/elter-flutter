import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class VendorRepository {
  final NetworkService networkService;
  VendorRepository(this.networkService);

  Future<List<Vendor>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.vendorApiRoute);
    return rawData.map((json) => Vendor.fromJson(json)).toList();
  }
}
