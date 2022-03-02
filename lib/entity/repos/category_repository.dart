import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/category.dart';

class CategoryRepository {
  final NetworkService networkService;
  CategoryRepository(this.networkService);

  Future<List<Category>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(ApiRoutes.categoryApiRoute);
    return rawData
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
