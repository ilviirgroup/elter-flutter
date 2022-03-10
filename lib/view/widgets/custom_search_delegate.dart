import 'package:elter/entity/models.dart';
import 'package:elter/view/pages/product/components/products_grid_view.dart';
import 'package:elter/view/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            )
          : const SizedBox(),

      InkWell(
        onTap: () async {
          String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Cancel", true, ScanMode.BARCODE);
          print(barcodeScanResult);
          query = barcodeScanResult;
        },
        child: SvgPicture.asset(
          'assets/icons/barcode-scanner.svg',
          width: 30,
          height: 30,
        ),
      ),
      const SizedBox(
        width: 20,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];

    for (var product in productList) {
      if (product.barcode!.contains(query) ||
          product.name.toLowerCase().contains(query.toLowerCase()) ||
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
      if (product.barcode!.contains(query) ||
          product.name.toLowerCase().contains(query.toLowerCase()) ||
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
