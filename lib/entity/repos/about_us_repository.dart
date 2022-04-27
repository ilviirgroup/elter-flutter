import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class AboutUsRepository {
  final NetworkService networkService;
  AboutUsRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.aboutUsApiRoute);
    return rawData.map((json) => AboutUs.fromJson(json)).toList();
  }
}
