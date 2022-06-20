import 'package:elter/view/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../entity/models.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/modify_price.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {Key? key, required this.orderList, required this.orderId})
      : super(key: key);
  final List<Order> orderList;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('Sargyt nomer $orderId'),
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final order = orderList[index];
          return SizedBox(
            height: 130,
            child: Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              elevation: 0.0,
              color: kWhite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 35, 10, 10),
                      child: Image.network(order.photo!),
                    ),
                  ),

                  // Product details

                  Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.productName,
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            productDetailRow(
                                'Bahasy', modifyPrice(order.price)),
                            productDetailRow(
                                'Sany', order.quantity.toInt().toString()),
                            productDetailRow(
                                'Jemi bahasy', modifyPrice(order.result!)),
                            productDetailRow(
                              'Satyjy',
                              order.vendorName,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding productDetailRow(String text, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: semiBoldTextStyle,
          ),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
