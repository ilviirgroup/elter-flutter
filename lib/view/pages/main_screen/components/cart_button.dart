import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          size: 24,
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
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text(
                        state.totalCartItems.toString(),
                        style: const TextStyle(
                            color: kWhite, fontWeight: FontWeight.bold),
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
