import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class ColorRepository {
  final NetworkService networkService;
  ColorRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.colorAPiRoute);
    return rawData.map((json) => ColorObject.fromJson(json)).toList();
  }
}
