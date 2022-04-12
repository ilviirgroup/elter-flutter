import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';

import 'package:elter/presenter/cubit/visited/visited_cubit.dart';
import 'package:elter/view/constants/colors.dart';
import 'package:elter/view/constants/enums.dart';
import 'package:elter/view/constants/constant_words.dart';

import 'package:elter/view/pages/cart/cart_screen.dart';
import 'package:elter/view/pages/catalog/catalog_page.dart';
import 'package:elter/view/pages/home/home_page.dart';
import 'package:elter/view/pages/product/components/product_detail_page.dart';
import 'package:elter/view/pages/profile/my_profile.dart';
import 'package:elter/view/pages/vendor/vendor_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin<MainScreen> {
  int selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    // GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  // List<Widget> screens = [];

  @override
  void initState() {
    context.read<VisitedCubit>().getVisited();
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    context.read<OnProductDetailPageCubit>().onNextPage((Product product) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            product: product,
          ),
        ),
      );
    });
    context.read<OnCartPageCubit>().toCartPage(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      );
    });
    final screenSize = MediaQuery.of(context).size;
    final changeBottomNavCubit = context.read<ChangeBottomNavCubit>();
    return BlocBuilder<ChangeBottomNavCubit, BottomNavScreen>(
      builder: (context, state) {
        final BottomNavScreen bottomNavScreen = state;
        selectedIndex = state.index;

        return WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[selectedIndex].currentState!.maybePop();
            if (isFirstRouteInCurrentTab) {
              if (selectedIndex != 0) {
                changeBottomNavCubit.changeBottomNavIndex(BottomNavScreen.home);
                return false;
              } else {
                DateTime now = DateTime.now();
                if (currentBackPressTime == null ||
                    now.difference(currentBackPressTime!) >
                        const Duration(seconds: 3)) {
                  currentBackPressTime = now;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Çykmak üçin ýene bir gezek basyň'),
                    ),
                  );
                  return Future.value(false);
                }
                return Future.value(true);
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            body: Stack(
              children: [
                _buildOffstageNavigator(0),
                _buildOffstageNavigator(1),
                // _buildOffstageNavigator(2),
                _buildOffstageNavigator(2),
                _buildOffstageNavigator(3),
              ],
            ),
            floatingActionButton: BlocBuilder<OnCartPageCubit, OnCartPageState>(
              builder: (context, state) {
                final Function toCartPage =
                    (state as OnCartPageLoaded).cartPage;
                return FloatingActionButton(
                    elevation: 0,
                    foregroundColor:
                        // bottomNavScreen == BottomNavScreen.cart
                        //     ? kWhite
                        //     :
                        unselectedIconColor,
                    backgroundColor:
                        // bottomNavScreen == BottomNavScreen.cart
                        //     ? kPrimaryColor
                        //     :
                        kWhite,
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 24,
                    ),
                    onPressed: () {
                      toCartPage();
                    }

                    // => changeBottomNavCubit
                    //     .changeBottomNavIndex(BottomNavScreen.cart),
                    );
              },
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
                      index: BottomNavScreen.home,
                      currentIndex: bottomNavScreen,
                      label: bottomNavigationIconLabels[BottomNavScreen.home]!,
                      icon: Icons.home_outlined,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.vendors,
                      currentIndex: bottomNavScreen,
                      label:
                          bottomNavigationIconLabels[BottomNavScreen.vendors]!,
                      icon: Icons.store_outlined,
                    ),
                    SizedBox(
                      width: screenSize.width / 5,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.catalog,
                      currentIndex: bottomNavScreen,
                      label:
                          bottomNavigationIconLabels[BottomNavScreen.catalog]!,
                      icon: Icons.dashboard_outlined,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.profile,
                      currentIndex: bottomNavScreen,
                      label:
                          bottomNavigationIconLabels[BottomNavScreen.profile]!,
                      icon: Icons.person_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomePage(),
          const VendorPage(),
          // const CartPage(),
          const CatalogPage(),
          const MyProfile(),
        ].elementAt(index);
      }
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
      offstage: selectedIndex != index,
      child: Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name]!(context),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class ProductDetailPageArgument {
//   final Product product;
//   ProductDetailPageArgument(this.product);
// }
