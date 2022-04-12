import 'package:elter/data/api_routes.dart';
import 'package:elter/data/network_service.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit/on_product_detail_page/on_product_detail_page_cubit.dart';
import 'package:elter/utils/modify_price.dart';
import 'package:elter/view/constants/colors.dart';
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
                  onNext(product);
                  networkService.getRequest.fetchData(product.url!);
                  // await networkService.updateRequest.patchData(patchObj: {
                  //   AdsApiFields.name: "Elter market"
                  // "http://96.30.193.58/Products/?ai=&name=&description=&vendor_name=1&supercategory=2&category=1&subcategory=&brand=&location=&gender=&barcode=&size=&color=&date=&new=&in_dollar=&exchange=&price=&discount=&discounted_price=&new_price=&calc_dollar=&calc_discount=true"
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
                            // price
                            Row(
                              children: [
                                product.isSale
                                    ? Text(
                                        modifyPrice(product.newPrice!),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: textRedColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )
                                    : Text(
                                        modifyPrice(product.newPrice!),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                product.isSale
                                    ? Text(
                                        modifyPrice(product.price),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: textGreyColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                      )
                                    : const SizedBox(),
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
        )
      ],
    );
  }
}
