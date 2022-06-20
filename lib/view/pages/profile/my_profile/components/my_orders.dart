part of 'package:elter/view/pages/profile/my_profile/my_profile.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('Sargytlarym'),
      body: BlocBuilder<MyOrdersBloc, MyOrdersState>(
        builder: (context, state) {
          if (state is! MyOrdersFetchSuccess) {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
          final List<Order>? orderList = state.myOrders!;
          if (orderList == null || orderList.isEmpty) {
            return const Center(child: Text('Sargyt edilen haryt ýok'));
          } else {
            List orderIds =
                orderList.map((e) => e.orderId).toList().toSet().toList();
            return ListView.builder(
                itemCount: orderIds.length,
                itemBuilder: (context, index) {
                  final order = orderIds[index];
                  List<Order> ordersById = orderList
                      .where((element) => element.orderId == order)
                      .toList();
                  double totalPrice = 0.0;
                  for (var order in ordersById) {
                    totalPrice += order.result!;
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderListItem(
                            orderList: ordersById,
                            orderId: order,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      elevation: 0.0,
                      color: kWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Sargyt nomeri:'),
                                    Text('Wagty:'),
                                    Text('Umumy bahasy'),
                                    Text('Status:'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(order),
                                    Text(ordersById.first.date.toString()),
                                    Text(modifyPrice(totalPrice)),
                                    ordersById.first.completed
                                        ? Text(
                                            'Gowşuryldy',
                                            style: semiBoldTextStyle.copyWith(
                                                color: kGreen),
                                          )
                                        : Text(
                                            'Taýýarlanýar',
                                            style: semiBoldTextStyle.copyWith(
                                                color: Colors.orange[700]),
                                          ),
                                  ],
                                ),
                                PopupMenuButton(
                                    padding: const EdgeInsets.all(0.0),
                                    itemBuilder: ((context) {
                                      return [
                                        PopupMenuItem(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AppAlertDialog(
                                                      content:
                                                          'Hakykatdan hem sargydy ýatyrmakçymy?',
                                                      alertType:
                                                          AlertTypes.warning,
                                                      callBack: () {
                                                        for (var item
                                                            in ordersById) {
                                                          context
                                                              .read<
                                                                  MyOrdersBloc>()
                                                              .add(
                                                                MyOrdersDeletedEvent(
                                                                    obj: const {
                                                                      'cancelled':
                                                                          true
                                                                    },
                                                                    id: item
                                                                        .pk!),
                                                              );
                                                        }
                                                      },
                                                    ));
                                          },
                                          child: const Text('Sargydy ýatyr'),
                                        )
                                      ];
                                    }))
                              ],
                            ),
                            SizedBox(
                              height: 90,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: ordersById
                                    .map((e) => Card(
                                          // color: Colors.green,
                                          child: SizedBox(
                                              width: 70,
                                              height: 90,
                                              child: Image.network(
                                                  e.photo ?? 'Surat yok')),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
