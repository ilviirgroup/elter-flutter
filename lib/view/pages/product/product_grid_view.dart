import 'package:elter/entity/models/ads.dart';
import 'package:elter/entity/models/product.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return BlocBuilder<TemporaryAdsObjectCubit, TemporaryAdsObjectState>(
      builder: (context, state) {
        if (state is! TemporaryAdsObjectLoaded) {
          return const LoadingIndicator();
        }
        final Ads adsObject = state.adsObject;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          "Tertiple",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          "Filtrle",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: dataProvider.adsProducts(adsObject.name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingIndicator();
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Haryt ýok'),
                      );
                    }
                    final List<Product> productsList =
                        snapshot.data as List<Product>;
                    return GridView.builder(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemCount: productsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 280,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final product = productsList[index];
                          return Container(
                            margin: const EdgeInsets.all(2),
                            height: 550,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 350,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(product.photo1!),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(product.brand ?? ''),
                                ),
                              ],
                            ),
                          );
                        });
                  }),
            )
          ],
        );
      },
    );
  }
}

List _products = [
  {
    "brandName": "Slazenger",
    "name": "Slazenger Zen Sneaker",
    "price": "99.99 TMT",
    "oldPrice": "184.90 TMT",
    "picture": "harydyn surady",
  },
  {
    "brandName": "Slazenger",
    "name": "Slazenger Maroon",
    "price": "114.99 TMT",
    "oldPrice": "214.90 TMT",
    "picture": "harydyn surady",
  },
  {
    "brandName": "Slazenger",
    "name": "Slazenger Genoa Sneaker",
    "price": "119.99 TMT",
    "oldPrice": "204.90 TMT",
    "picture": "harydyn surady",
  },
  {
    "brandName": "Slazenger",
    "name": "Slazenger Teppe Sneaker",
    "price": "129.99 TMT",
    "oldPrice": "239.90 TMT",
    "picture": "harydyn surady",
  },
  {
    "brandName": "Slazenger",
    "name": "Slazenger Adopt Kosu &",
    "price": "124.99 TMT",
    "oldPrice": "234.90 TMT",
    "picture": "harydyn surady",
  },
  {
    "brandName": "Slazenger",
    "name": "Slazenger Albus I",
    "price": "99.99 TMT",
    "oldPrice": "189.90 TMT",
    "picture": "harydyn surady",
  },
];
