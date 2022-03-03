import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/location.dart';

class LocationRepository {
  final NetworkService networkService;
  LocationRepository(this.networkService);

  Future<List<Location>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.locationApiRoute);
    return rawData.map((json) => Location.fromJson(json)).toList();
  }
}
