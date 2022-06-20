import 'dart:convert';

import 'package:http/http.dart' as http;

class Get {
  Future fetchData(String apiRoute) async {
    try {
      final response = await http.get(Uri.parse(apiRoute), headers: {
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
