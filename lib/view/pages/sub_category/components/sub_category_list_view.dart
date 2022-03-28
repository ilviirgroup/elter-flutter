import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/styles.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_list_item.dart';

class SubCategoryListView extends StatelessWidget {
  final String categoryName;

  const SubCategoryListView({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, state) {
         if (state is! SubCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SubCategory>? subCategoryList = state.subCategories;
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          child: Scrollbar(
            child: ListView(
              children: subCategoryList!
                  .where(
                      (subCategory) => subCategory.category == categoryName)
                  .toList()
                  .map(
                    (subCategoryItem) => SubCategoryListItem(item: subCategoryItem),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
