import 'package:elter/entity/models/category.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/utils/enums.dart';
import 'package:elter/view/pages/sub_category/components/sub_category_list_view.dart';
import 'package:elter/view/widgets/app_bar_with_tab_bar.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryPage extends StatelessWidget {
  final Category categoryObject;

  const SubCategoryPage({Key? key, required this.categoryObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is! CategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<Category> categoryList = state.categories;
        return DefaultTabController(
          initialIndex: categoryList.indexOf(categoryObject),
          length: categoryList.length,
          child: Scaffold(
            appBar: appBarWithTabBar(
                context, categoryList, BottomNavScreen.catalog),
            body: TabBarView(
                children: categoryList
                    .map((e) => SubCategoryListView(categoryName: e.name))
                    .toList()),
          ),
        );
      },
    );
  }
}
