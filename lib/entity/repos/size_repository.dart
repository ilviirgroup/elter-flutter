import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/size.dart';

class SizeRepository {
  final NetworkService networkService;
  SizeRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.sizeApiRoute);
    return rawData.map((json) => Size.fromJson(json)).toList();
  }
}
