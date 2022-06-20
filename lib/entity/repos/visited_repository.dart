import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class VisitedRepository {
  final NetworkService networkService;
  VisitedRepository(this.networkService);

  Future<Visited> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.visitedApiRoute);
    return Visited.fromJson(rawData.first );
  }

  Future<Visited> visited() async {
    final visitedModel = await fetchData();

    final rawData =
        await networkService.getRequest.fetchData(visitedModel.url!);
    return Visited.fromJson(rawData);
  }
}
