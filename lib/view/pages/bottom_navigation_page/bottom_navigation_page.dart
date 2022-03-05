import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/presenter/cubit/visited/visited_cubit.dart';

import 'package:elter/view/pages/cart/cart_screen.dart';
import 'package:elter/view/pages/catalog/catalog_screen.dart';
import 'package:elter/view/pages/home/home_screen.dart';
import 'package:elter/view/pages/profile/my_profile.dart';
import 'package:elter/view/pages/season/new_products.dart';
import 'package:elter/view/styles.dart';
import 'package:elter/view/widgets/app_bar_with_filter.dart';
import 'package:elter/view/widgets/app_bar_with_tab_bar.dart';
import 'package:elter/view/widgets/loading_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_nav_item.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavScreensState createState() => _BottomNavScreensState();
}

class _BottomNavScreensState extends State<BottomNavigationPage>
    with AutomaticKeepAliveClientMixin<BottomNavigationPage> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const NewProducts(),
      const CartScreen(),
      const CatalogScreen(),
      const MyProfile()
    ];
    context.read<VisitedCubit>().getVisited();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final changeBottomNavCubit = context.read<ChangeBottomNavCubit>();
    return SafeArea(
      child: BlocBuilder<ChangeBottomNavCubit, int>(
        builder: (context, state) {
          final int bottomIndex = state;

          return BlocBuilder<ChangeHomeScreensCubit, int>(
            builder: (context, state) {
              final int homeScreenIndex = state;

              return BlocBuilder<SuperCategoryCubit, SuperCategoryState>(
                builder: (context, state) {
                  if (state is! SuperCategoryLoaded) {
                    return const LoadingIndicator();
                  }
                  final List<SuperCategory> superCategoryList =
                      state.superCategories;

                  return BlocBuilder<TemporaryAdsObjectCubit,
                      TemporaryAdsObjectState>(
                    builder: (context, state) {
                      if (state is! TemporaryAdsObjectLoaded) {
                        return const LoadingIndicator();
                      }
                      final Ads adsObject = state.adsObject;

                      return DefaultTabController(
                        length: superCategoryList.length + 1,
                        child: Scaffold(
                          appBar: bottomIndex == 0 && homeScreenIndex == 0
                              ? appBarWithTabBar(context, superCategoryList)
                              : bottomIndex == 0 && homeScreenIndex == 1
                                  ? appBarWithFilter(context, adsObject)
                                  : bottomIndex == 1
                                      ? AppBar()
                                      : bottomIndex == 2
                                          ? AppBar()
                                          : bottomIndex == 3
                                              ? appBarWithTabBar(
                                                  context, superCategoryList)
                                              : bottomIndex == 4
                                                  ? AppBar()
                                                  : AppBar(),
                          body: screens[bottomIndex],
                          floatingActionButton: FloatingActionButton(
                            elevation: 0,
                            foregroundColor: bottomIndex == 2
                                ? Colors.white
                                : unselectedIconColor,
                            backgroundColor:
                                bottomIndex == 2 ? kPrimaryColor : Colors.white,
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 24,
                            ),
                            onPressed: () =>
                                changeBottomNavCubit.changeBottomNavIndex(2),
                          ),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerDocked,
                          bottomNavigationBar: BottomAppBar(
                            shape: const CircularNotchedRectangle(),
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BottomNavItem(
                                    index: 0,
                                    currentIndex: bottomIndex,
                                    label: 'Esasy',
                                    icon: Icons.home,
                                  ),
                                  BottomNavItem(
                                    index: 1,
                                    currentIndex: bottomIndex,
                                    label: "Täzeler",
                                    icon: Icons.new_releases_outlined,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 5,
                                  ),
                                  BottomNavItem(
                                    index: 3,
                                    currentIndex: bottomIndex,
                                    label: "Katalog",
                                    icon: Icons.format_align_justify,
                                  ),
                                  BottomNavItem(
                                    index: 4,
                                    currentIndex: bottomIndex,
                                    label: "Profil",
                                    icon: Icons.person,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
