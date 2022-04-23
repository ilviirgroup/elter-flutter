import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartIcon extends StatelessWidget {
  final Product product;
  const CartIcon({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CartBloc>().add(CartAddedEvent(product));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: kPrimaryColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Icon(
          Icons.add_shopping_cart_rounded,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
