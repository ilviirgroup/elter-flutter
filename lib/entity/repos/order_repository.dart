import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class OrderRepository {
  final NetworkService networkService;
  OrderRepository(this.networkService);

  Future<List<Order>> fetchData(UrlBuilder urlBuilder) async {
    final List rawData = await networkService.getRequest.fetchData(
        BaseUrl.baseUrl + ApiRoutes.orderApiRoute + urlBuilder.toString());
    return rawData.map((json) => Order.fromJson(json)).toList();
  }

  Future sendOrder(Map<String, dynamic> dataObj) async {
    final orderMap = await networkService.postRequest
        .addData(dataObj: dataObj, apiRoute: ApiRoutes.orderApiRoute);
    return Order.fromJson(orderMap);
  }

  Future deleteOrder(int id) async {
    return await networkService.deleteRequest
        .deleteData(id, ApiRoutes.orderApiRoute);
  }
}

class UrlBuilder {
  String phone = '';
  String productName = '';
  String userName = '';

  @override
  String toString() {
    return '?ai=&name_order=$productName&adress=&user_name=$userName&user_email=&user_phone=%2B${phone.substring(1)}&completed=&in_process=&price_order=&quantity=&result=';
  }
}
