import 'package:elter/utils/constants/app_icons.dart';
import 'package:elter/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presenter/bloc.dart';
import '../../utils/constants/app_colors.dart';

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
          BottomBarIcons.cart,
        ),
      ),
      Positioned(
        top: 0,
        right: 2,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return state.cartItems.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        state.totalCartItems.toString(),
                        style: semiBoldTextStyle.copyWith(
                            color: kWhite, fontFamily: 'Roboto'),
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
