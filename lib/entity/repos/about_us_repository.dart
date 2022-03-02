import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/about_us.dart';

class AboutUsRepository {
  final NetworkService networkService;
  AboutUsRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(ApiRoutes.aboutUsApiRoute);
    return rawData.map((json) => AboutUs.fromJson(json)).toList();
  }
}
