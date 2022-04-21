import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit/on_product_detail_page/on_product_detail_page_cubit.dart';
import 'package:elter/utils/modify_price.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'label_new_product.dart';

final NetworkService networkService = NetworkService();

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          height: 550,
          width: 350,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: kWhite,
          ),
          child:
              BlocBuilder<OnProductDetailPageCubit, OnProductDetailPageState>(
            builder: (context, state) {
              final Function onNext =
                  (state as OnProductDetailPageLoaded).onNext;
              return GestureDetector(
                onTap: () async {
                  // await networkService.deleteRequest
                  //     .deleteData(4, ApiRoutes.adsApiRoute);
                  onNext(product);
                  await networkService.getRequest.fetchData(product.url!);
                  // await networkService.updateRequest.patchData(patchObj: {
                  //   AdsApiFields.name: "Elter market"
                  // "http://96.30.193.58/Products/?ai=&name=&description=&vendor_name=&supercategory=2&category=2&subcategory=&brand=&location=&gender=&barcode=&size=&color=&date=&new=&in_dollar=&exchange=&price=&discount=&discounted_price=&new_price=&calc_dollar=&calc_discount=true"
                  // }, id: 3, apiRoute: ApiRoutes.adsApiRoute);
                },
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              product.photo1!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                product.brand!,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: kBlack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: textGreyColor),
                              ),
                            ),
                            // --------------- price
                            Row(
                              children: [
                                product.isSale
                                    ? Text(modifyPrice(product.newPrice!),
                                        style: discountedPriceStyle)
                                    : Text(modifyPrice(product.newPrice!),
                                        style: priceStyle),
                                const SizedBox(
                                  width: 10,
                                ),
                                product.isSale
                                    ? Text(modifyPrice(product.price),
                                        style: oldPriceStyle)
                                    : const SizedBox(),
                                BlocBuilder<CartBloc, CartState>(
                                  builder: (context, state) {
                                    if (state is CartLoadedState) {
                                      Product? isAddedToCart;
                                      for (var item in state.cartItems) {
                                        if (item.productId ==
                                                product.productId &&
                                            item.name == product.name) {
                                          isAddedToCart = item;
                                        }
                                      }
                                      return isAddedToCart == null
                                          ? Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  context.read<CartBloc>().add(
                                                      CartAddedEvent(product));
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            )
                                          : const SizedBox();
                                    }
                                    return const SizedBox();
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 12,
          left: 1,
          child: product.isNew ? const NewProductLabel() : const SizedBox(),
        ),
        Positioned(
            top: 0,
            right: 0,
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
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.orange.withOpacity(0.5),
                                  ]),
                              // color: kGreen.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(50.0))),
                          margin: const EdgeInsets.only(top: 2, right: 2),
                          width: 20,
                          height: 550 / 3,
                          child: const RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Sebetde',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: kWhite,
                                    fontWeight: FontWeight.w600),
                              )),
                        )
                      : const SizedBox();
                }
                return const SizedBox();
              },
            ))
      ],
    );
  }
}
