import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class VerificationCodeRepository {
  final NetworkService networkService;
  VerificationCodeRepository(this.networkService);

  Future<VerificationCode> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.verificationCodeApiRoute);
    return rawData
        .map((json) => VerificationCode.fromJson(json))
        .toList()
        .first;
  }
}
