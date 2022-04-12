import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/pages/product/products_page.dart';
import 'package:elter/view/widgets/custom_grid_delegate.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorsGridView extends StatelessWidget {
  const VendorsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorBloc, VendorState>(
      builder: (context, state) {
        if (state is! VendorFetchSuccess) {
          return const LoadingIndicator();
        }
        List<Vendor> vendorList = state.vendorList;

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
                      .temporarySubCategoryObject(vendorList[index].vendorName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsPage(
                        productsList: productList
                            .where((element) =>
                                element.vendorName ==
                                vendorList[index].vendorName)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: containerDecoration(),
                  child: vendorList[index].photo.isNotEmpty
                      ? Image.network(vendorList[index].photo)
                      : const Center(
                          child: Text('No photo'),
                        ),
                ),
              ),
              itemCount: vendorList.length,
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
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }
}
