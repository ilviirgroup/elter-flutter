import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/update.dart';

class UpdateRepository {
  final NetworkService networkService;
  UpdateRepository(this.networkService);

  Future fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(ApiRoutes.updateApiRoute);
    return Update.fromJson(rawData.first);
  }
}
