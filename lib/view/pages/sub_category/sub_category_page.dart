import '../../../entity/models/category.dart';
import '../../../presenter/cubit.dart';
import '../../../utils/constants/app_enums.dart';
import 'components/sub_category_list_view.dart';
import '../../widgets/app_bar_with_tab_bar.dart';
import '../../widgets/loading_indicator.dart';
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
        List<Category> catList = categoryList
            .where((category) =>
                category.superCategory == categoryObject.superCategory)
            .toList();
        return DefaultTabController(
          initialIndex: catList.indexOf(categoryObject),
          length: catList.length,
          child: Scaffold(
            appBar: appBarWithTabBar(context, catList, BottomNavScreen.catalog),
            body: TabBarView(
                children: catList
                    .map((e) => SubCategoryListView(categoryName: e.name))
                    .toList()),
          ),
        );
      },
    );
  }
}
