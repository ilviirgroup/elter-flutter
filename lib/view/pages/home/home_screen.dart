import 'package:elter/presenter/cubit/change_home_screens/change_home_screens_cubit.dart';
import 'package:elter/view/pages/product/products_grid_view.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

import 'package:elter/view/pages.dart';
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
    return BlocBuilder<ChangeHomeScreensCubit, ChangeHomeScreensState>(
      builder: (context, state) {
        if (state is! HomeScreenChanged) {
          return const LoadingIndicator();
        }
        final int currentIndex = state.screenIndex;
        return homeScreens[currentIndex];
      },
    );
  }
}
