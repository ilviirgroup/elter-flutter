import 'dart:convert';

import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models/product.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

final NetworkService networkService = NetworkService();

class DataProvider with ChangeNotifier {
  Future<List<Product>> adsProducts(String adsUrl) async {
    final List decodedData = await networkService.getRequest.fetchData(adsUrl);
    // http.Response res = await http.get(Uri.parse(adsUrl));
    // if (res.statusCode == 200) {
    return parseProduct(decodedData);

    // throw Exception('Unable to fetch PRODUCTS from the REST API');
  }

  List<Product> parseProduct(List decodedData) {
    // final parsed = jsonDecode(utf8.decode(response.bodyBytes))
    //     .cast<Map<String, dynamic>>();
    return decodedData.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
