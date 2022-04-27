import 'package:elter/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presenter/bloc.dart';
import '../../../../utils/constants/app_colors.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return state.cartItems.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text(
                        state.totalCartItems.toString(),
                        style: semiBoldTextStyle.copyWith(color: kWhite),
                      ),
                    )
                  : const SizedBox();
            }
            return const SizedBox();
          },
        ),
      )
    ]);
  }
}
