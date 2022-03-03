import 'package:elter/entity/models/ads.dart';
import 'package:elter/entity/models/product.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/presenter/provider.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'product_grid_view_item.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, this.products}) : super(key: key);

  final List<Product>? products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
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
            widget.products != null
                ? Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemCount: widget.products!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 280,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final product = widget.products![index];
                          return ProductGridViewItem(product: product);
                        }),
                  )
                : Expanded(
                    child: FutureBuilder(
                        future: dataProvider.adsProducts(adsObject.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                return ProductGridViewItem(product: product);
                              });
                        }),
                  )
          ],
        );
      },
    );
  }
}
