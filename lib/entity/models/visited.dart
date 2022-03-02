class Visited {
  int visit;
  String? url;

  Visited({
    required this.visit,
    this.url,
  });

  factory Visited.fromJson(Map<String, dynamic> json) => Visited(
        visit: json[VisitedApiFields.visit],
        url: json[VisitedApiFields.url],
      );
}

class VisitedApiFields {
  static const visit = 'visit';
  static const url = "url";
}
