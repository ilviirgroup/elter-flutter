import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class AdsRepository {
  final NetworkService networkService;
  AdsRepository(this.networkService);

  Future<List<Ads>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.adsApiRoute);
    return rawData.map((json) => Ads.fromJson(json)).toList();
  }
}
