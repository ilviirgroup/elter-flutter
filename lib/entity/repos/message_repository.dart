import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class MessageRepository {
  final NetworkService networkService;
  MessageRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.messageApiRoute);
    return rawData.map((json) => Message.fromJson(json)).toList();
  }
}
