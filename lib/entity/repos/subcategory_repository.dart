import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class SubCategoryRepository {
  final NetworkService networkService;
  SubCategoryRepository(this.networkService);

  Future<List<SubCategory>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.subCategoryApiRoute);
    return rawData.map((json) => SubCategory.fromJson(json)).toList();
  }
}
