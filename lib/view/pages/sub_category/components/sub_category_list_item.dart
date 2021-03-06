import '../../../../entity/models.dart';
import '../../../../presenter/bloc.dart';
import '../../../../presenter/cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../product/products_page.dart';
import '../../../widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryListItem extends StatelessWidget {
  final SubCategory item;
  const SubCategoryListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is! ProductsLoadedState) {
          return const LoadingIndicator();
        }
        final List<Product> productList = state.products;

        return InkWell(
          onTap: () {
            context
                .read<TemporarySubcategoryObjectCubit>()
                .temporarySubCategoryObject(item.name);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsPage(
                  productsList: productList
                      .where((element) => element.subCategory == item.name)
                      .toList(),
                ),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: kScaffoldBackgroundColor, width: 2),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        );
      },
    );
  }
}
