import 'package:elter/view/widgets/up_scroll_button.dart';
import 'package:flutter/material.dart';

import 'package:elter/entity/models.dart';
import 'package:flutter/rendering.dart';
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

class _ProductsGridViewState extends State<ProductsGridView>
    with SingleTickerProviderStateMixin {
  bool showButton = false;

  void toggleButton() {
    setState(() {
      showButton = !showButton;
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        setState(() {
          if (notification.direction == ScrollDirection.forward) {
            showButton = false;
          } else if (notification.direction == ScrollDirection.reverse) {
            showButton = true;
          }
        });
        return true;
      },
      child: Stack(
        children: [
          Scrollbar(
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
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: UpScrollButton(
              scrollUp: scrollUp,
              toggleButton: toggleButton,
              showButton: showButton,
            ),
          ),
        ],
      ),
    );
  }
}
