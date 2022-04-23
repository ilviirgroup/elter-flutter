import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 2)
class User extends HiveObject {
  @HiveField(0)
  final int? pk;
  @HiveField(1)
  String? address;
  @HiveField(2)
  String? name;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String? url;

  User({
    this.pk,
    this.address,
    this.name,
    required this.phoneNumber,
    this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        address: json[UserApiFields.address] ?? '',
        name: json[UserApiFields.name] ?? '',
        phoneNumber: json[UserApiFields.phoneNumber],
        pk: json[UserApiFields.pk],
        url: json[UserApiFields.url],
      );

  Map<String, dynamic> toJson() => {
        UserApiFields.address: address,
        UserApiFields.name: name,
      };
}

class UserApiFields {
  static const address = 'address';
  static const name = 'name';
  static const phoneNumber = 'number';
  static const pk = 'pk';
  static const url = 'url';
}
