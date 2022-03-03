import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/visited.dart';

class VisitedRepository {
  final NetworkService networkService;
  VisitedRepository(this.networkService);

  Future<Visited> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.visitedApiRoute);
    return Visited.fromJson(rawData.first);
  }
}
