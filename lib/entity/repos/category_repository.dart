import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class CategoryRepository {
  final NetworkService networkService;
  CategoryRepository(this.networkService);

  Future<List<Category>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.categoryApiRoute);
    return rawData
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
