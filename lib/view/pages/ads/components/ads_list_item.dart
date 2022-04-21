import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/pages/product/products_page.dart';

import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';

class AdsListItem extends StatelessWidget {
  const AdsListItem({
    Key? key,
    required this.adsItem,
  }) : super(key: key);

  final Ads adsItem;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<AdsProductCubit>().initializeAdsProductCubit();
        context.read<AdsProductCubit>().fetchAdsProduct(adsItem);
        context.read<TemporaryAdsObjectCubit>().temporaryAdsObject(adsItem);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocBuilder<AdsProductCubit, AdsProductState>(
              builder: (context, state) {
                if (state is! AdsProductLoaded) {
                  return const LoadingIndicator();
                }
                final List<Product> adsProductList = state.products;
                return ProductsPage(
                  adsProductList: adsProductList,
                );
              },
            ),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [kPrimaryColor, Colors.orange]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 1.5, 0, 1.5),
              height: screenSize.height / 6,
              child: Text(
                adsItem.description,
                style: const TextStyle(fontSize: 20, color: kWhite),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(adsItem.photo), fit: BoxFit.cover),
                color: kWhite,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 1.5, 10, 1.5),
              height: screenSize.height / 6,
            ),
          ),
        ],
      ),
    );
  }
}
