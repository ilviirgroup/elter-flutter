import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/pages/super_category/super_category_list_view.dart';
import 'package:elter/view/widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List catalogScreens = [];

  @override
  void initState() {
    catalogScreens = [
      const SuperCategoryListView(),
      const SearchScreen(),
    ];
    context.read<SearchTappedCubit>().toogleSearchEvent(false);
    context.read<ChangeCatalogScreensCubit>().changeCatalogScreen(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCatalogScreensCubit, int>(
      builder: (context, state) {
        return catalogScreens[state];
      },
    );
  }
}
