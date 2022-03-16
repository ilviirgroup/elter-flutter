import 'package:elter/view/widgets/app_bar_with_filter.dart';
import 'package:elter/view/widgets/up_scroll_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';

import 'package:elter/view/widgets/loading_indicator.dart';
import 'components/products_grid_view.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, this.productsList, this.adsProductList})
      : super(key: key);

  final List<Product>? adsProductList;
  final List<Product>? productsList;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return 
    // BlocBuilder<AdsProductCubit, AdsProductState>(
    //   builder: (context, state) {
        // List<Product>? adsProductList;
        // if (state is AdsProductLoaded) {
        //   adsProductList = state.products;
        // }
        // return 
        BlocBuilder<TemporarySubcategoryObjectCubit,
            TemporarySubcategoryObjectState>(
          builder: (context, state) {
            if (state is! TemporarySubcategoryObjectLoaded) {
              return const LoadingIndicator();
            }
            final SubCategory subCategoryObject = state.subCategory;
            return BlocBuilder<TemporaryAdsObjectCubit,
                TemporaryAdsObjectState>(
              builder: (context, state) {
                if (state is! TemporaryAdsObjectLoaded) {
                  return const LoadingIndicator();
                }
                final Ads adsObject = state.adsObject;
                return Scaffold(
                  appBar: widget.adsProductList == null
                      ? appBarWithFilter(
                          context,
                          widget.productsList!.length,
                          subCategoryObject: subCategoryObject
                          
                        )
                      : appBarWithFilter(context, widget.adsProductList!.length,
                          adsObject: adsObject,),
                  body: NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      setState(() {
                        if (notification.direction == ScrollDirection.forward) {
                          showButton = false;
                        } else if (notification.direction ==
                            ScrollDirection.reverse) {
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
                            widget.productsList != null
                                ? Expanded(
                                    child: ProductsGridView(
                                        products: widget.productsList!),
                                  )
                                : Expanded(
                                    child: ProductsGridView(
                                        products: widget.adsProductList),
                                  )
                          ],
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
                  ),
                );
              },
            );
          },
        );
    //   },
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
