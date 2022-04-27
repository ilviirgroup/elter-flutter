import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class UpdateRepository {
  final NetworkService networkService;
  UpdateRepository(this.networkService);

  Future fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.updateApiRoute);
    return Update.fromJson(rawData.first);
  }
}
