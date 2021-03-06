import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class SuperCategoryRepository {
  final NetworkService networkService;
  SuperCategoryRepository(this.networkService);

  Future<List<SuperCategory>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.superCategoryApiRoute);
    return rawData.map((json) => SuperCategory.fromJson(json)).toList();
  }
}
