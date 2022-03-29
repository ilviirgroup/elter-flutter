import 'package:elter/utils/enums.dart';
import 'package:elter/view/pages/ads/components/ads_list_view.dart';
import 'package:elter/view/widgets/app_bar_with_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/view/widgets/loading_indicator.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
      builder: (context, state) {
        if (state is! SuperCategoryLoaded) {
          return const LoadingIndicator();
        }
        final List<SuperCategory> superCategoryList = state.superCategories;

        return DefaultTabController(
          length: superCategoryList.length + 1,
          child: Scaffold(
            appBar: appBarWithTabBar(
                context, superCategoryList, BottomNavScreen.home),
            body: TabBarView(children: [
              const AdsListView(),
              ...superCategoryList.map(
                (e) {
                  return AdsListView(
                    superCategoryName: e.name,
                  );
                },
              )
            ]),
          ),
        );
      },
    );
  }
}
