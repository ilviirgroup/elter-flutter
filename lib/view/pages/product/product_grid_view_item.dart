import 'package:elter/entity/models/product.dart';
import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

import 'new_product_label.dart';

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
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.photo1!,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        product.brand!,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w700, color: kBlack),
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
                    Row(
                      children: [
                        Text(
                          product.newPrice.toString(),
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: textRedColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.price.toString(),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: textGreyColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        product.isNew! ? const NewProductLabel() : const SizedBox(),
      ],
    );
  }
}
