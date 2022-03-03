import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/ads.dart';

class AdsRepository {
  final NetworkService networkService;
  AdsRepository(this.networkService);

  Future<List<Ads>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.adsApiRoute);
    return rawData.map((json) => Ads.fromJson(json)).toList();
  }
}
