class Location {
  int pk;
  String name;
  String? url;

  Location({required this.pk, required this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(name: json[''], pk: json[''], url: json['']);
}

class LocationApiFields {
  static const pk = 'pk';
  static const name = 'name';
  static const url = 'url';
}
