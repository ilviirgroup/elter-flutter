import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
          final List<Order> orderList = state.myOrders!;
          if (orderList == null || orderList.isEmpty) {
            return const Center(child: Text('Sargyt edilen haryt ýok'));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final order = orderList[index];
                return SizedBox(
                  height: _size.height * 0.2,
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 0.0,
                    color: kWhite,
                    child: Row(
                      children: [
                        Text(order.productName + order.pk!.toString()),
                        InkWell(
                          onTap: () {
                            context
                                .read<MyOrdersBloc>()
                                .add(MyOrdersDeletedEvent(id: order.pk!));
                          },
                          child: const Icon(Icons.close),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: orderList.length,
            );
          }
        },
      ),
    );
  }
}
