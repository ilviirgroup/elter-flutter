class Admin {
  int pk;
  String name;
  String password;
  String phone;
  String shopName;
  String userName;
  String url;

  Admin({
    required this.pk,
    required this.name,
    required this.password,
    required this.phone,
    required this.shopName,
    required this.userName,
    required this.url,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
      pk: json[AdminApiFields.pk],
      name: json[AdminApiFields.name],
      password: json[AdminApiFields.password],
      phone: json[AdminApiFields.phone],
      shopName: json[AdminApiFields.shopName],
      userName: json[AdminApiFields.userName],
      url: json[AdminApiFields.url]);
}

class AdminApiFields {
  static const pk = 'pk';
  static const name = 'name';
  static const password = 'password';
  static const phone = 'phone';
  static const shopName = 'name_branch';
  static const userName = 'username';
  static const url = 'url';
}
