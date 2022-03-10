import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/styles.dart';
import 'package:elter/view/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'super_category_list_item.dart';

class SuperCategoryListView extends StatelessWidget {
  const SuperCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
      builder: (context, state) {
        if (state is! SuperCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SuperCategory> superCategoryList = state.superCategories;
        return ListView.separated(
          itemBuilder: (context, index) {
            final superCat = superCategoryList[index];
            return SuperCategoryListItem(superCat: superCat);
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: whiteGrey,
              ),
            );
          },
          itemCount: superCategoryList.length,
        );
      },
    );
  }
}
