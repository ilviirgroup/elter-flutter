import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../entity/models.dart';
import '../../../../presenter/bloc.dart';
import '../../../../presenter/cubit.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/modify_price.dart';

class BottomPriceBar extends StatelessWidget {
  const BottomPriceBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: kWhite,
      height: 70.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          product.isSale ? SalePercentage(product: product) : const SizedBox(),
          product.isSale
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        modifyPrice(product.price),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: textGreyColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                      Text(
                        modifyPrice(product.newPrice!),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    modifyPrice(product.newPrice!),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoadedState) {
                  Product? isAddedToCart;
                  for (var item in state.cartItems) {
                    if (item.productId == product.productId &&
                        item.name == product.name) {
                      isAddedToCart = item;
                    }
                  }
                  return isAddedToCart != null
                      ? BlocBuilder<OnCartPageCubit, OnCartPageState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  (state as OnCartPageLoaded).cartPage();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: kWhite,
                                    side: const BorderSide(
                                        width: 2, color: kPrimaryColor)),
                                child: const Text('Haryt sebetde',
                                    style: TextStyle(color: kPrimaryColor)),
                              ),
                            );
                          },
                        )
                      : ButtonAddingToCart(product: product);
                }
                return ButtonAddingToCart(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAddingToCart extends StatelessWidget {
  const ButtonAddingToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          context
              .read<CartBloc>()
              .add(CartAddedEvent(product..selectedQuantity = 1));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: snackDuration,
              content: Text('Sebede goşuldy'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 70),
            ),
          );
        },
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
        child: const Text('Sebede goş'),
      ),
    );
  }
}

class SalePercentage extends StatelessWidget {
  const SalePercentage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: textRedColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '%${product.discountPercentage!.ceil().toString()}',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: kWhite,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
