import 'dart:convert';

import 'package:elter/data/api_routes.dart';
import 'package:http/http.dart' as http;

class Get {
  @override
  Future fetchData(String apiRoute) async {
    try {
      final response = await http.get(Uri.parse(BaseUrl.baseUrl + apiRoute),
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          });
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
      return [];
    }
  }
}
