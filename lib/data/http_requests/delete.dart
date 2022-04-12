import 'package:elter/data/api_routes.dart';
import 'package:http/http.dart' as http;

class Delete {
  Future deleteData(int id, String apiRoute) async {
    try {
      var uri = Uri.encodeFull('${BaseUrl.baseUrl}$apiRoute$id/');
      var res = await http.delete(Uri.parse(uri));
      print(res.statusCode);
      // if (res.statusCode == 404) {
      //   return false;
      // } else {
      //   return true;
      // }
    } catch (er) {
      throw Exception(er);
    }
  }
}
