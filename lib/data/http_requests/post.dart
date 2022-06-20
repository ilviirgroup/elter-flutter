import 'dart:convert';

import 'package:http/http.dart';

import '../api_routes.dart';

class Post {
  Future<Map<String, dynamic>> addData(
      {required Map<String, dynamic> dataObj, required String apiRoute}) async {
    try {
      final response = await post(
        Uri.parse(BaseUrl.baseUrl + apiRoute),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Connection": "keep-alive",
        },
        body: jsonEncode(dataObj),
      );
      print(response.statusCode);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      return {};
    }
  }
}
