class Ads {
  int pk;
  String description;
  String name;
  String photo;
  String superCategory;
  // String? url;

  Ads({
    required this.pk,
    required this.description,
    required this.name,
    required this.photo,
    required this.superCategory,
    // this.url,
  });

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
      pk: json[AdsApiFields.pk],
      description: json[AdsApiFields.description],
      name: json[AdsApiFields.name],
      photo: json[AdsApiFields.photo] ?? '',
      superCategory: json[AdsApiFields.superCategory]
      // url: json[AdsApiFields.url],
      );
}

class AdsApiFields {
  static const pk = "pk";
  static const description = "description";
  static const name = "name";
  static const photo = "photo";
  static const superCategory = "spcategory";
}
