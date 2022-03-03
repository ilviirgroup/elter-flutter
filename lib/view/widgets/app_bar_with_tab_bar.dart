import 'package:elter/entity/models/product.dart';
import 'package:elter/presenter/bloc.dart';
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
                return const IgnorePointer(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteGrey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: """Elterde gözle""",
                      prefixIcon: Icon(
                        Icons.search,
                        color: kBlack,
                      ),
                    ),
                  ),
                );
              }
              final List<Product> productList = state.products;
              return InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(productList),
                  );
                },
                child: const IgnorePointer(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteGrey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: """Elterde gözle""",
                      prefixIcon: Icon(
                        Icons.search,
                        color: kBlack,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
    bottom: TabBar(
      labelColor: Colors.black,
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
