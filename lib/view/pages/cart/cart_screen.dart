import 'package:elter/presenter/bloc.dart';
import 'package:elter/utils/modify_price.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/constant_numbers.dart';
import 'package:elter/view/constants/styles.dart';
import 'package:elter/view/pages/cart/componenst/cart_screen_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'componenst/cart_list_view_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sebet',
          style: boldTextStyle,
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            final cartItems = state.cartItems;
            return cartItems.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            ...state.cartItems.map(
                              (e) => CartListViewItem(product: e),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: MediaQuery.of(context).size.width,
                        color: kWhite,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Jemi bahasy'),
                                Text(
                                  modifyPrice(state.totalAmount),
                                  style: boldTextStyle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.isDeliveryFree
                                    ? Text(
                                        'Eltmesi Mugt',
                                        style: boldTextStyle.copyWith(
                                            color: kGreen),
                                      )
                                    : const Text('Eltmek hyzmaty',
                                        style: semiBoldTextStyle),
                                state.isDeliveryFree
                                    ? const SizedBox()
                                    : Text(
                                        modifyPrice(
                                          deliveryPrice,
                                        ),
                                        style: boldTextStyle)
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: kWhite,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 50, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Umumy',
                                      style: TextStyle(
                                          color: textGreyColor, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const CartScreenBottomSheet(),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          state.isDeliveryFree
                                              ? Text(
                                                  modifyPrice(
                                                      state.totalAmount),
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 18),
                                                )
                                              : Text(
                                                  modifyPrice(
                                                      (state.totalAmount +
                                                          deliveryPrice)),
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 18),
                                                ),
                                          const SizedBox(width: 5.0),
                                          const Icon(
                                              Icons.keyboard_arrow_up_outlined)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Sargyt et'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                      'Sebediňizde haryt ýok',
                      style: semiBoldTextStyle,
                    ),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
