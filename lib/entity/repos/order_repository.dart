import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';

class OrderRepository {
  final NetworkService networkService;
  OrderRepository(this.networkService);

  Future<List<Order>> fetchData() async {
    final List rawData =
        await networkService.getRequest.fetchData(BaseUrl.baseUrl + ApiRoutes.orderApiRoute);
    return rawData.map((json) => Order.fromJson(json)).toList();
  }

  Future sendOrder(Map<String, dynamic> dataObj) async {
    final orderMap = await networkService.postRequest
        .addData(dataObj: dataObj, apiRoute: ApiRoutes.orderApiRoute);
    return Order.fromJson(orderMap);
  }

  Future<bool> deleteOrder(int id) async {
    return await networkService.deleteRequest
        .deleteData(id, ApiRoutes.orderApiRoute);
  }
}
