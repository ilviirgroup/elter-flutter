import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class ColorRepository {
  final NetworkService networkService;
  ColorRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.colorAPiRoute);
    return rawData.map((json) => ColorObject.fromJson(json)).toList();
  }
}


// '{'key': 'value'}' json - javascript object notation