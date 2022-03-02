import 'dart:convert';

import 'package:elter/entity/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  Future<List<Product>> adsProducts(String adsUrl) async {
    http.Response res = await http.get(Uri.parse(adsUrl));
    if (res.statusCode == 200) {
      return parseProduct(res);
    }
    throw Exception('Unable to fetch PRODUCTS from the REST API');
  }

  List<Product> parseProduct(var response) {
    final parsed = jsonDecode(utf8.decode(response.bodyBytes))
        .cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
