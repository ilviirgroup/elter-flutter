class VerificationCode {
  final int pk;
  final String code;
  final String phoneNumber;
  final String url;

  VerificationCode({
    required this.code,
    required this.phoneNumber,
    required this.pk,
    required this.url,
  });

  factory VerificationCode.fromJson(Map<String, dynamic> json) =>
      VerificationCode(
        code: json[VerificationCodeApiFields.code],
        phoneNumber: json[VerificationCodeApiFields.phoneNumber],
        pk: json[VerificationCodeApiFields.pk],
        url: json[VerificationCodeApiFields.url],
      );
}

class VerificationCodeApiFields {
  static const pk = 'pk';
  static const code = 'code';
  static const phoneNumber = 'phone_number';
  static const url = 'url';
}
