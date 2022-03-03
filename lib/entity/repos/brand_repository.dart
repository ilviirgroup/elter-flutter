import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/brand.dart';

class BrandRepository {
  final NetworkService networkService;
  BrandRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.brandApiRoute);
    return rawData.map((json) => Brand.fromJson(json)).toList();
  }
}
