import '../../entity/models.dart';
import '../../presenter/bloc.dart';

import '../../utils/constants/constants.dart';
import 'search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_search_delegate.dart';

AppBar appBarWithTabBar(
    BuildContext context, List tabItems, BottomNavScreen bottomNavScreen) {
  final screenSize = MediaQuery.of(context).size;
  return AppBar(
    actions: bottomNavScreen == BottomNavScreen.home
        ? [
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
          ]
        : [],
    bottom: TabBar(
      labelColor: kBlack,
      indicatorColor: kPrimaryColor,
      isScrollable: true,
      tabs: bottomNavScreen == BottomNavScreen.home
          ? [
              const Tab(
                text: 'Ähli arzanlar',
              ),
              ...tabItems.map((tabs) => Tab(
                    text: tabs.name,
                  ))
            ]
          : tabItems
              .map((tabs) => Tab(
                    text: tabs.name,
                  ))
              .toList(),
    ),
  );
}
