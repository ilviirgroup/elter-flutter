import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class MessageRepository {
  final NetworkService networkService;
  MessageRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.messageApiRoute);
    return rawData.map((json) => Message.fromJson(json)).toList();
  }
}
