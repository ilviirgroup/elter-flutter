import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/color.dart';

class ColorRepository {
  final NetworkService networkService;
  ColorRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(ApiRoutes.colorAPiRoute);
    return rawData.map((json) => Color.fromJson(json)).toList();
  }
}
