import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit/temporary_subcategory_object/temporary_subcategory_object_cubit.dart';
import 'package:elter/view/pages/product/products_page.dart';
import 'package:elter/view/widgets/custom_grid_delegate.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsGridView extends StatelessWidget {
  const BrandsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is! BrandFetchSuccess) {
          return const LoadingIndicator();
        }
        List<Brand> brandList = state.brandList;

        return BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is! ProductsLoadedState) {
              return const LoadingIndicator();
            }
            List<Product> productList = state.products;
            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context
                      .read<TemporarySubcategoryObjectCubit>()
                      .temporarySubCategoryObject(brandList[index].name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsPage(
                        productsList: productList
                            .where((element) =>
                                element.brand == brandList[index].name)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: containerDecoration(),
                  child: brandList[index].photo!.isNotEmpty
                      ? Image.network(brandList[index].photo!)
                      : const Center(
                          child: Text('No photo'),
                        ),
                ),
              ),
              itemCount: brandList.length,
              gridDelegate: customGridDelegate(3),
            );
          },
        );
      },
    );
  }

  BoxDecoration containerDecoration() {
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 1),
          blurRadius: 5.0,
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }
}
