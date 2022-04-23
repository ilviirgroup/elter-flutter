import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit.dart';

import 'package:elter/utils/modify_price.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/styles.dart';
import 'package:elter/view/pages/product/components/color_container.dart';
import 'package:elter/view/pages/product/components/new_product_label.dart';
import 'package:elter/view/pages/product/components/size_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: _size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.photo1!,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                widget.product.isNew
                    ? const Positioned(
                        top: 12,
                        right: 1,
                        child: NewProductLabel(),
                      )
                    : const SizedBox(),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.brand!,
                      style: boldTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Text(
                      widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: textGreyColor),
                    ),
                  ),
                  const Divider(
                    indent: 8,
                    endIndent: 15,
                    thickness: 2,
                  ),
                  widget.product.color! != 'Standart'
                      ? ColorContainer(product: widget.product)
                      : const SizedBox(),
                  widget.product.size! != 'Standart'
                      ? SizeContainer(product: widget.product)
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Satyjy: ",
                        style: boldTextStyle.copyWith(fontSize: 17)),
                    Text(
                      widget.product.vendorName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ExpansionTile(
                textColor: kBlack,
                iconColor: kBlack,
                backgroundColor: kWhite,
                title: const Text("Haryt barada"),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                    child: Text(widget.product.description!),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ExpansionTile(
                title: const Text("Eltip bermek hyzmaty"),
                textColor: kBlack,
                iconColor: kBlack,
                backgroundColor: kWhite,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "Eltip bermek hyzmaty",
                            style: boldTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                              """•Eltip bermek hyzmatynyň tölegi harydyňyza görä. Häzirlikçe sagatda 40 km tizlik bilen hereket edýän elektro skooterimiz bar şonuň bilen nesip bolsa halkymyza hezil bereris!!!"""),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),

      // bottomsheet

      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        color: kWhite,
        height: 70.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.product.isSale
                ? Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: textRedColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '%${widget.product.discountPercentage!.ceil().toString()}',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: kWhite,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox(),
            widget.product.isSale
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          modifyPrice(widget.product.price),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: textGreyColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        Text(
                          modifyPrice(widget.product.newPrice!),
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
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
                      modifyPrice(widget.product.newPrice!),
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
                      if (item.productId == widget.product.productId &&
                          item.name == widget.product.name) {
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
                              // AddToCartButton(
                              //   color: kGreen,
                              //   label: 'Haryt sebetde',
                              //   addToCart: () {
                              //     (state as OnCartPageLoaded).cartPage();
                              //   },
                              // );
                            },
                          )
                        : AddToCartButton(
                            color: kPrimaryColor,
                            label: 'Sebede goş',
                            addToCart: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartAddedEvent(widget.product));
                            },
                          );
                  }
                  return AddToCartButton(
                    color: kPrimaryColor,
                    label: 'Sebede goş',
                    addToCart: () {
                      context
                          .read<CartBloc>()
                          .add(CartAddedEvent(widget.product));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final Color color;
  final String label;
  final Function addToCart;
  const AddToCartButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          addToCart();
        },
        style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .copyWith(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(label),
      ),
    );
  }
}
