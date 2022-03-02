import 'package:elter/entity/models/ads.dart';
import 'package:elter/entity/models/super_category.dart';
import 'package:elter/presenter/bloc.dart';

import 'package:elter/view/pages.dart';
import 'package:elter/view/styles.dart';
import 'package:elter/view/widgets/app_bar_with_tab_bar.dart';
import 'package:elter/view/widgets/loading_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_nav_item.dart';

class BottomNavigationScreens extends StatefulWidget {
  const BottomNavigationScreens({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavScreensState createState() => _BottomNavScreensState();
}

class _BottomNavScreensState extends State<BottomNavigationScreens>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const NewProducts(),
      const CartScreen(),
      const CategoryListView(),
      const MyProfile()
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final changeBottomNavCubit = context.read<ChangeBottomNavCubit>();
    return SafeArea(
      child: BlocBuilder<ChangeBottomNavCubit, ChangeBottomNavState>(
        builder: (context, state) {
          if (state is! ChangeBottomNavChanged) {
            return const LoadingIndicator();
          }
          final int bottomIndex = state.index;

          return BlocBuilder<ChangeHomeScreensCubit, ChangeHomeScreensState>(
            builder: (context, state) {
              if (state is! HomeScreenChanged) {
                return const LoadingIndicator();
              }
              final int homeScreenIndex = state.screenIndex;

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
                                  ? AppBar(
                                      leading: IconButton(
                                          onPressed: () {
                                            context
                                                .read<ChangeHomeScreensCubit>()
                                                .changeHomeScreen(0);
                                                context.read<ChangeBottomNavCubit>().changeIndex(0);
                                          },
                                          icon: Icon(Icons.arrow_back)),
                                      title: Text(adsObject.description),
                                    )
                                  : bottomIndex == 1
                                      ? AppBar()
                                      : bottomIndex == 2
                                          ? AppBar()
                                          : bottomIndex == 3
                                              ? AppBar()
                                              : bottomIndex == 4
                                                  ? AppBar()
                                                  : AppBar(),
                          body: screens[bottomIndex],
                          floatingActionButton: FloatingActionButton(
                            foregroundColor:
                                bottomIndex == 2 ? Colors.white : Colors.grey,
                            backgroundColor:
                                bottomIndex == 2 ? kPrimaryColor : Colors.white,
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 24,
                            ),
                            onPressed: () =>
                                changeBottomNavCubit.changeIndex(2),
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
}
