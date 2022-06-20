import 'package:flutter/rendering.dart';

import '../../../data/network_service.dart';
import '../../../presenter/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../entity/models.dart';
import '../../../presenter/cubit.dart';
import '../../../utils/collect_images.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/modify_price.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/widgets.dart';
import 'components/add_to_cart_button.dart';

part 'components/cart_icon.dart';
part 'components/color_container.dart';
part 'components/in_the_cart_label.dart';
part 'components/new_product_label.dart';
part 'components/product_detail_page.dart';
part 'components/product_grid_view_item.dart';
part 'components/products_grid_view.dart';
part 'components/size_container.dart';
part 'components/zoom_photo.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    this.productsList,
    this.adsProductList,
  }) : super(key: key);

  final List<Product>? adsProductList;
  final List<Product>? productsList;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    context.read<SortByCubit>().sortBy(SortingItemNames.defaultOrder);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemporarySubcategoryObjectCubit,
        TemporarySubcategoryObjectState>(
      builder: (context, state) {
        if (state is! TemporarySubcategoryObjectLoaded) {
          return const LoadingIndicator();
        }
        final String subCategoryObject = state.appBarTitle;
        return BlocBuilder<TemporaryAdsObjectCubit, TemporaryAdsObjectState>(
          builder: (context, state) {
            if (state is! TemporaryAdsObjectLoaded) {
              return const LoadingIndicator();
            }
            final Ads adsObject = state.adsObject;
            return Scaffold(
              appBar: widget.adsProductList == null
                  ? appBarWithFilter(context, widget.productsList!.length,
                      appBarTitle: subCategoryObject)
                  : appBarWithFilter(
                      context,
                      widget.adsProductList!.length,
                      adsObject: adsObject,
                    ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.productsList != null
                      ? Expanded(
                          child: BlocBuilder<SortByCubit, SortByState>(
                            builder: (context, state) {
                              final String sortBy =
                                  (state as SortByCalled).sortBy;
                              switchSort(sortBy);
                              return ProductsGridView(
                                products: widget.productsList,
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child:
                              ProductsGridView(products: widget.adsProductList),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void switchSort(String sortBy) {
    switch (sortBy) {
      case SortingItemNames.cheapestFirst:
        widget.productsList!.sort(
          (a, b) => a.newPrice!.compareTo(b.newPrice!),
        );
        break;
      case SortingItemNames.expensiveFirst:
        widget.productsList!.sort((a, b) => b.newPrice!.compareTo(a.newPrice!));
        // widget.productsList!.sort(
        //   (a, b) {
        //     if (b.newPrice != null && a.newPrice != null) {
        //       return b.newPrice!.compareTo(a.newPrice!);
        //     } else if (b.newPrice != null) {
        //       b.newPrice!.compareTo(a.price);
        //     } else if (a.newPrice != null) {
        //       return b.price.compareTo(a.newPrice!);
        //     } else {
        //       return b.price.compareTo(a.price);
        //     }

        //     return 1;
        //   },
        // );
        break;
      case SortingItemNames.bestsellers:
        widget.productsList!.sort(
          (a, b) => b.visited.compareTo(a.visited),
        );
        break;
      default:
        widget.productsList!.sort(
          (a, b) => b.pk.compareTo(a.pk),
        );
    }
  }
}
