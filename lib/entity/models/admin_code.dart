class AdminCode {
  int pk;
  String url;
  String phoneNumber;
  String verificationCode;

  AdminCode({
    required this.pk,
    required this.url,
    required this.phoneNumber,
    required this.verificationCode,
  });

  factory AdminCode.fromJson(Map<String, dynamic> json) => AdminCode(
      pk: json[AdminCodeApiFields.pk],
      url: json[AdminCodeApiFields.url],
      phoneNumber: json[AdminCodeApiFields.phoneNumber],
      verificationCode: json[AdminCodeApiFields.verificationCode]);
}

class AdminCodeApiFields {
  static String phoneNumber = "phone_number";
  static String pk = "pk";
  static String url = "url";
  static String verificationCode = "code";
}
