class User {
  final int pk;
  final String? address;
  final String? name;
  final String phoneNumber;
  final String? url;

  User({
    required this.pk,
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
}

class UserApiFields {
  static const address = 'address';
  static const name = 'name';
  static const phoneNumber = 'number';
  static const pk = 'pk';
  static const url = 'url';
}
