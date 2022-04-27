import '../../../entity/models.dart';
import '../../../presenter/cubit.dart';

import '../../../utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import '../sub_category/sub_category_page.dart';

part 'components/category_list_view.dart';
part 'components/category_list_item.dart';


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
