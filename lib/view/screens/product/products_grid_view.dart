import 'package:elter/view/widgets/up_scroll_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/presenter/provider.dart';
import 'package:elter/view/widgets/loading_indicator.dart';

import 'components/product_grid_view_item.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, this.products}) : super(key: key);

  final List<Product>? products;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
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
    final dataProvider = Provider.of<DataProvider>(context);
    return BlocBuilder<TemporaryAdsObjectCubit, TemporaryAdsObjectState>(
      builder: (context, state) {
        if (state is! TemporaryAdsObjectLoaded) {
          return const LoadingIndicator();
        }
        final Ads adsObject = state.adsObject;
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.products != null
                      ? Expanded(
                          child: productGridViewBuilder(widget.products),
                        )
                      : Expanded(
                          child: BlocBuilder<AdsProductCubit, AdsProductState>(
                              builder: (context, state) {
                            if (state is! AdsProductLoaded) {
                              return const LoadingIndicator();
                            }

                            final List<Product>? productsList = state.products;
                            return productGridViewBuilder(productsList);
                          }),
                        )
                ],
              ),
              UpScrollButton(
                scrollUp: scrollUp,
                toggleButton: toggleButton,
                showButton: showButton,
              ),
            ],
          ),
        );
      },
    );
  }

  GridView productGridViewBuilder(List<Product>? productList) {
    return GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemCount: productList!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = productList[index];
          return ProductGridViewItem(product: product);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
