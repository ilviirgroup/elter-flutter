import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository implements SignIn {
  UserRepository(this.networkService);
  final NetworkService networkService;
  late Box<User> _currentUser;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    // await Hive.openBox<User>('userBox');
    // await Hive.deleteBoxFromDisk('userBox');
    _currentUser = await Hive.openBox<User>('userBox');
    // _currentUser.add(User(phoneNumber: '1234'));
  }

  Future<List<User>> fetchData() async {
    final List rawData = await networkService.getRequest
        .fetchData(BaseUrl.baseUrl + ApiRoutes.userApiRoute);
    return rawData.map((json) => User.fromJson(json)).toList();
  }

  Future<VerificationCode> getVerificationCode(
      VerificationCode verificationCode) async {
    final updatedObject = await networkService.updateRequest.patchData(
        apiRoute: ApiRoutes.verificationCodeApiRoute,
        patchObj: verificationCode.toJson(),
        id: verificationCode.pk);
    return VerificationCode.fromJson(updatedObject);
  }

  Future<void> updateUserInfos(User user) async {
    final response = await networkService.updateRequest.patchData(
        patchObj: User(
                phoneNumber: user.phoneNumber,
                name: user.name,
                address: user.address)
            .toJson(),
        id: user.pk!,
        apiRoute: ApiRoutes.userApiRoute);
    final updatedUser = User.fromJson(response);
    return await upDateToken(updatedUser);
  }

  @override
  Future<User> sigIn(VerificationCode code) async {
    final userList = await fetchData();

    final List users = userList
        .where((element) => element.phoneNumber == code.phoneNumber)
        .toList();

    if (users.isEmpty) {
      final newUser =
          await registerUser({UserApiFields.phoneNumber: code.phoneNumber});

      persistToken(newUser);
      return newUser;
    }

    persistToken(users.first);
    return users.first;
  }

  @override
  Future<User> registerUser(Map<String, dynamic> obj) async {
    final userMap = await networkService.postRequest
        .addData(dataObj: obj, apiRoute: ApiRoutes.userApiRoute);
    return User.fromJson(userMap);
  }

  void persistToken(final User authenticatedUser) {
    _currentUser.add(authenticatedUser);
  }

  Future<void> deleteToken(String userPhone) async {
    final userToSignOut = _currentUser.values
        .firstWhere((element) => element.phoneNumber == userPhone);
    await userToSignOut.delete();
  }

  Future<void> upDateToken(User user) async {
    final userToEdit = _currentUser.values
        .firstWhere((element) => element.phoneNumber == user.phoneNumber);
    final index = userToEdit.key as int;
    await _currentUser.put(
        index,
        userToEdit
          ..address = user.address
          ..name = user.name);
  }

  List<User> getUser() {
    return _currentUser.values.toList();
  }

  // Future<void> persistToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // write to keystore/keychain
  //   await prefs.setString('token', token);
  //   return;
  // }

  // Future<void> deleteToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('token');
  //   // delete from keystore/keychain
  //   await Future.delayed(const Duration(seconds: 1));
  //   return;
  // }

  // Future getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }
}

abstract class SignIn {
  registerUser(Map<String, dynamic> obj);
  sigIn(VerificationCode code);
}
