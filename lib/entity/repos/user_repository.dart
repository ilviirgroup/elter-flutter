import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final NetworkService networkService;
  UserRepository(this.networkService);

  Future<List> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.userApiRoute);
    return rawData.map((json) => User.fromJson(json)).toList();
  }

   Future<VerificationCode> getVerificationCode(
      Map<String, dynamic> putObject, int id) async {
    final updatedObject = await networkService.updateRequest.patchData(
        apiRoute: ApiRoutes.verificationCodeApiRoute, patchObj: putObject, id: id);
    return VerificationCode.fromJson(updatedObject);
  }

  Future<User> saveUser(Map<String, dynamic> obj) async {
    final userMap = await networkService.postRequest
        .addData(dataObj: obj, apiRoute: ApiRoutes.userApiRoute);
    print((User.fromJson(userMap)).phoneNumber);
    return User.fromJson(userMap);
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // write to keystore/keychain
    await prefs.setString('token', token);
    return;
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    // delete from keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
