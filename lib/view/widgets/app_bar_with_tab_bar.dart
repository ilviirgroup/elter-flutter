import 'package:elter/entity/models.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles.dart';
import 'custom_search_delegate.dart';

AppBar appBarWithTabBar(BuildContext context, List tabItems) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
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
                focusColor: kTransparent,
                hoverColor: kTransparent,
                highlightColor: kTransparent,
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
          ),
        ),
      ),
    ],
    bottom: TabBar(
      // indicator: const BoxDecoration(color: kScaffoldBackgroundColor),
      labelColor: kBlack,
      indicatorColor: kPrimaryColor,
      isScrollable: true,
      tabs: [
        const Tab(
          text: 'Ähli arzanlar',
        ),
        ...tabItems.map((tabs) => Tab(
              text: tabs.name,
            ))
      ],
    ),
  );
}
