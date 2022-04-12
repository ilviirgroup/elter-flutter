import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/constants/enums.dart';
import 'package:elter/view/pages/category/components/category_list_view.dart';
import 'package:elter/view/widgets/app_bar_with_tab_bar.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  final SuperCategory superCategoryObject;
  const CategoryPage({Key? key, required this.superCategoryObject})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
      builder: (context, state) {
        if (state is! SuperCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SuperCategory> superCategoryList = state.superCategories;
        return DefaultTabController(
          initialIndex: superCategoryList.indexOf(widget.superCategoryObject),
          length: superCategoryList.length,
          child: Scaffold(
            appBar: appBarWithTabBar(
                context, superCategoryList, BottomNavScreen.catalog),
            body: TabBarView(
              children: superCategoryList.map((e) {
                return CategoryListView(superCategoryName: e.name);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
