import 'package:elter/entity/models.dart';
import 'package:elter/view/screens/product/products_grid_view.dart';
import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Product> productList;
  CustomSearchDelegate(this.productList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: kWhite,
        foregroundColor: kBlack,
      ),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none),
    );
  }

  @override
  String get searchFieldLabel => '';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              icon: const Icon(Icons.clear),
              splashRadius: 15,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent)
          : const SizedBox(),
      IconButton(
          onPressed: () {},
          icon: const Icon(Icons.qr_code),
          splashRadius: 15,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent),
      const SizedBox(
        width: 10,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];

    for (var product in productList) {
      if (product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.brand!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return matchQuery.isEmpty
        ? Center(
            child: Text(
            'Bagyşlaň! Siziň gözleýän zadyňyz tapylmady.',
            style: Theme.of(context).textTheme.titleMedium,
          ))
        : ProductsGridView(
            products: matchQuery,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    for (var product in productList) {
      if (product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.brand!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return query.isEmpty
        ? Center(
            child: Text(
            'Gözleg sözüni ýazyň',
            style: Theme.of(context).textTheme.titleMedium,
          ))
        : matchQuery.isEmpty
            ? Center(
                child: Text(
                'Bagyşlaň! Siziň gözleýän sadyňyz tapylmady.',
                style: Theme.of(context).textTheme.titleMedium,
              ))
            : ProductsGridView(
                products: matchQuery,
              );
  }
}
