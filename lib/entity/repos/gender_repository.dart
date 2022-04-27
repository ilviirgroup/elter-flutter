import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class GenderRepository {
  final NetworkService networkService;
  GenderRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.genderApiRoute);
    return rawData.map((json) => Gender.fromJson(json)).toList();
  }
}
