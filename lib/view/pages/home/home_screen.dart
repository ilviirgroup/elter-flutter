import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/screens/ads/ads_page.dart';
import 'package:elter/view/screens/product/products_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeScreen> {
  List homeScreens = [];

  @override
  void initState() {
    super.initState();
    homeScreens = [
      const AdsPage(),
      const ProductsGridView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeHomeScreensCubit, int>(
      builder: (context, state) {
        final int currentIndex = state;
        return homeScreens[currentIndex];
      },
    );
  }
}
