import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/entity/models/super_category.dart';
import 'package:elter/view/pages/ads/components/ads_list_view.dart';
import 'package:elter/view/widgets/loading_indicator.dart';

import '../../../presenter/bloc.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
      builder: (context, state) {
        if (state is! SuperCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SuperCategory> superCategoryList = state.superCategories;

        return TabBarView(children: [
          const AdsListView(),
          ...superCategoryList.map(
            (e) {
              return AdsListView(superCatName: e.name);
            },
          )
        ]);
      },
    );
  }
}
