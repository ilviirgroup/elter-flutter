import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class LocationRepository {
  final NetworkService networkService;
  LocationRepository(this.networkService);

  Future<List<Location>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.locationApiRoute);
    return rawData.map((json) => Location.fromJson(json)).toList();
  }
}
