import 'package:elter/entity/models.dart';
import 'package:elter/presenter/cubit.dart';
import 'package:elter/presenter/cubit/visited/visited_cubit.dart';
import 'package:elter/utils/enums.dart';

import 'package:elter/view/pages/cart/cart_screen.dart';
import 'package:elter/view/pages/catalog/catalog_page.dart';
import 'package:elter/view/pages/home/home_page.dart';
import 'package:elter/view/pages/product/components/product_detail_page.dart';
import 'package:elter/view/pages/profile/my_profile.dart';
import 'package:elter/view/pages/season/new_products.dart';
import 'package:elter/view/styles.dart';

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
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  int selectedIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomePage(),
      const NewProducts(),
      const CartScreen(),
      const CatalogPage(),
      const MyProfile(),
    ];
    context.read<VisitedCubit>().getVisited();
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                _buildOffstageNavigator(2),
                _buildOffstageNavigator(3),
                _buildOffstageNavigator(4),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              foregroundColor: bottomNavScreen == BottomNavScreen.cart
                  ? kWhite
                  : unselectedIconColor,
              backgroundColor: bottomNavScreen == BottomNavScreen.cart
                  ? kPrimaryColor
                  : kWhite,
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 24,
              ),
              onPressed: () => changeBottomNavCubit
                  .changeBottomNavIndex(BottomNavScreen.cart),
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
                      label: 'Esasy',
                      icon: Icons.home,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.news,
                      currentIndex: bottomNavScreen,
                      label: "Täzeler",
                      icon: Icons.new_releases_outlined,
                    ),
                    SizedBox(
                      width: screenSize.width / 5,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.catalog,
                      currentIndex: bottomNavScreen,
                      label: "Katalog",
                      icon: Icons.grid_view,
                    ),
                    BottomNavItem(
                      index: BottomNavScreen.profile,
                      currentIndex: bottomNavScreen,
                      label: "Profil",
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
        return screens.elementAt(index);
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
            switch (routeSettings.name) {
              case '/product-detail':
                final args =
                    routeSettings.arguments as ProductDetailPageArgument;
                return MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(product: args.product));
              case '/':
              default:
                return MaterialPageRoute(
                  builder: (context) =>
                      routeBuilders[routeSettings.name]!(context),
                );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProductDetailPageArgument {
  final Product product;
  ProductDetailPageArgument(this.product);
}
