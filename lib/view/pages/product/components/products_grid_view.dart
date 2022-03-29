import 'package:flutter/material.dart';

import 'package:elter/entity/models.dart';
import 'product_grid_view_item.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    Key? key,
    this.products,
  }) : super(key: key);

  final List<Product>? products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemCount: widget.products!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = widget.products![index];
          return ProductGridViewItem(
            product: product,
          );
        },
      ),
    );
  }
}
