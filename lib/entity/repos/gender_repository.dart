import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/gender.dart';

class GenderRepository {
  final NetworkService networkService;
  GenderRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.genderApiRoute);
    return rawData.map((json) => Gender.fromJson(json)).toList();
  }
}
