import 'dart:convert';

import 'package:elter/data/api_routes.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  contentType: "application/json",
  responseType: ResponseType.plain,
));

class Patch {
  Future<Map<String, dynamic>> patchData(
      {required Map<String, dynamic> patchObj,
      required int id,
      required String apiRoute}) async {
    try {
      FormData formData = FormData.fromMap(patchObj);
      final response =
          await dio.patch('${BaseUrl.baseUrl}$apiRoute$id/', data: formData);
      print((response.statusCode));
      return jsonDecode('${response.data}') as Map<String, dynamic>;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
