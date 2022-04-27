import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class SizeRepository {
  final NetworkService networkService;
  SizeRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.sizeApiRoute);
    return rawData.map((json) => MySize.fromJson(json)).toList();
  }
}
