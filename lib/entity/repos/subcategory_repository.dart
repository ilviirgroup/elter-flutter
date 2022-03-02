import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/sub_category.dart';

class SubCategoryRepository {
  final NetworkService networkService;
  SubCategoryRepository(this.networkService);

  Future<List<SubCategory>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(ApiRoutes.subCategoryApiRoute);
    return rawData.map((json) => SubCategory.fromJson(json)).toList();
  }
}
