import '../../data/api_routes.dart';
import '../../data/network_service.dart';
import '../models.dart';

class OrderRepository {
  final NetworkService networkService;
  OrderRepository(this.networkService);

  late List<Order> myOrders;

  Future<void> fetchData(String phone) async {
    UrlBuilder urlBuilder = UrlBuilder()..userPhone = phone;
    final List rawData = await networkService.getRequest.fetchData(
        BaseUrl.baseUrl + ApiRoutes.orderApiRoute + urlBuilder.toString());
    List<Order> _myOrders =
        rawData.map((json) => Order.fromJson(json)).toList();
    myOrders = _myOrders.where((element) => !element.cancelled).toList();
  }

  List<String> orderIds() {
    return myOrders.map((e) => e.orderId!).toList().toSet().toList();
  }

  Future sendOrder(Map<String, dynamic> dataObj) async {
    final orderMap = await networkService.postRequest
        .addData(dataObj: dataObj, apiRoute: ApiRoutes.orderApiRoute);

    return Order.fromJson(orderMap);
  }

  Future cancelOrder(Map<String, dynamic> obj, int id) async {
    return await networkService.updateRequest
        .patchData(patchObj: obj, id: id, apiRoute: ApiRoutes.orderApiRoute);
  }

  Future deleteOrder(int id) async {
    return await networkService.deleteRequest
        .deleteData(id, ApiRoutes.orderApiRoute);
  }
}

class UrlBuilder {
  String? orderId;
  String? productName;
  String? vendorName;
  String? address;
  String? userName;
  String? userEmail;
  String userPhone = '';
  bool? completed;
  bool? onProcess;
  String? color;
  String? size;
  double? price;
  double? quantity;
  double? result;

  @override
  String toString() {
    List filterList = [
      '${OrderApiFields.orderId}=${orderId ?? ''}',
      '${OrderApiFields.productName}=${productName ?? ''}',
      '${OrderApiFields.vendorName}=${vendorName ?? ''}',
      '${OrderApiFields.address}=${address ?? ''}',
      '${OrderApiFields.userName}=${userName ?? ''}',
      '${OrderApiFields.userEmail}=${userEmail ?? ''}',
      '${OrderApiFields.userPhone}=%2B${userPhone.substring(1)}',
      '${OrderApiFields.completed}=${completed ?? ''}',
      '${OrderApiFields.onProcess}=${onProcess ?? ''}',
      '${OrderApiFields.color}=${color ?? ''}',
      '${OrderApiFields.size}=${size ?? ''}',
      '${OrderApiFields.price}=${price ?? ''}',
      '${OrderApiFields.quantity}=${quantity ?? ''}',
      '${OrderApiFields.result}=${result ?? ''}',
    ];
    return '?${filterList.join('&')}';
  }
}
