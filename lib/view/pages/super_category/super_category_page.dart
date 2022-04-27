import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/models.dart';
import '../../../presenter/bloc.dart';
import '../../../presenter/cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/custom_search_delegate.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/search_bar.dart';
import '../category/category_page.dart';

part 'super_category_list_view.dart';
part 'super_category_list_item.dart';

class SuperCategoryPage extends StatelessWidget {
  const SuperCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: screenSize.width - 20,
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is! ProductsLoadedState) {
                        return searchBar();
                      }
                      final List<Product> productList = state.products;

                      return InkWell(
                        splashColor: kTransparent,
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(productList),
                          );
                        },
                        child: searchBar(),
                      );
                    },
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Kategoriýalar',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Expanded(child: SuperCategoryListView())
            ],
          ),
        ));
  }
}
