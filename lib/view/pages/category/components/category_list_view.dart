import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit/category_cubit/category_cubit.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/pages/category/components/category_list_item.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListView extends StatelessWidget {
  final String superCategoryName;

  const CategoryListView({Key? key, required this.superCategoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is! CategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<Category> allCategoryList = state.categories;
        final List<Category> categoryList = allCategoryList
            .where((category) => category.superCategory == superCategoryName)
            .toList();
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: categoryList
                .map(
                  (categoryItem) => CategoryListItem(item: categoryItem),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
