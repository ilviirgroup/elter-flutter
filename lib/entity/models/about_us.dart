class AboutUs {
  String? email;
  String phone1;
  String? phone2;
  String? phone3;
  int pk;
  String url;
  String? webSite;

  AboutUs({
    this.email,
    required this.phone1,
    this.phone2,
    this.phone3,
    required this.pk,
    required this.url,
    this.webSite,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
        email: json[AboutUsApiFields.email],
        phone1: json[AboutUsApiFields.phone1],
        phone2: json[AboutUsApiFields.phone2],
        phone3: json[AboutUsApiFields.phone3],
        pk: json[AboutUsApiFields.pk],
        url: json[AboutUsApiFields.url],
        webSite: json[AboutUsApiFields.webSite],
      );
}

class AboutUsApiFields {
  static String email = "email";
  static String phone1 = "phone1";
  static String phone2 = "phone2";
  static String phone3 = "phone3";
  static String pk = "pk";
  static String url = "url";
  static String webSite = "website";
}
