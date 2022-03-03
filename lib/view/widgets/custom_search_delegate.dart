import 'package:elter/entity/models/product.dart';
import 'package:elter/view/pages/product/products_grid_view.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Product> productList;
  CustomSearchDelegate(this.productList);

  @override
  String get searchFieldLabel => '';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
          splashRadius: 15,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent),
      IconButton(
          onPressed: () {},
          icon: const Icon(Icons.qr_code),
          splashRadius: 15,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent),
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
    return ProductsGridView(
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
        : ProductsGridView(
            products: matchQuery,
          );
  }
}
