import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/verification_code.dart';

class VerificationCodeRepository {
  final NetworkService networkService;
  VerificationCodeRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.verificationCodeApiRoute);
    return rawData.map((json) => VerificationCode.fromJson(json)).toList();
  }
}
