import 'package:elter/presenter/bloc/cart/cart_bloc.dart';
import 'package:elter/utils/constants/app_colors.dart';
import 'package:elter/utils/constants/app_enums.dart';
import 'package:elter/view/widgets/app_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

AppBar simpleAppBar(
  String title, [
  bool? cartPage,
]) {
  return AppBar(
    backgroundColor: cartPage != null ? kTransparent : null,
    centerTitle: true,
    title: Text(
      title,
      style: boldTextStyle,
    ),
    actions: cartPage != null
        ? [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoadedState) {
                final cartList = state.cartItems;
                return Visibility(
                  visible: cartList.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AppAlertDialog(
                                  content:
                                      'Hakykatdan hem sebedi arassalamakçymy?',
                                  alertType: AlertTypes.warning,
                                  callBack: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartEmptiedEvent());
                                  },
                                );
                              });
                        },
                        child: const Icon(
                          Icons.remove_shopping_cart_outlined,
                          color: textGreyColor,
                        )),
                  ),
                );
              }
              return const SizedBox();
            }),
          ]
        : [],
  );
}
