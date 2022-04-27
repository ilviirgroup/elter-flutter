import 'dart:async';

import '../../../entity/models.dart';
import '../../../presenter/bloc.dart';
import '../../../presenter/cubit.dart';

import '../../../utils/constants/constants.dart';
import '../cart/cart_screen.dart';
import '../catalog/catalog_page.dart';
import '../home/home_page.dart';
import '../product/products_page.dart';
import '../profile/login/login.dart';
import '../profile/profile.dart';
import '../vendor/vendor_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_nav_bar.dart';
import 'components/bottom_nav_item.dart';
import 'components/cart_button.dart';

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
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    context.read<VisitedCubit>().getVisited();
    context.read<CartBloc>().add(CartLoadedEvent());
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    context.read<OnCartPageCubit>().toCartPage(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      );
    });
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
    context.read<OnSignInPageCubit>().toSignInPage(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInPage(),
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
                      behavior: SnackBarBehavior.floating,
                      content: Text("Çykmak üçin ýene bir gezek 'YZA' basyň!"),
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
              ],
            ),
            floatingActionButton: BlocBuilder<OnCartPageCubit, OnCartPageState>(
              builder: (context, state) {
                final Function toCartPage =
                    (state as OnCartPageLoaded).cartPage;
                return FloatingActionButton(
                    elevation: 0,
                    foregroundColor: unselectedIconColor,
                    backgroundColor: kWhite,
                    child: const CartButton(),
                    onPressed: () {
                      toCartPage();
                    });
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavBar(
                bottomNavScreen: bottomNavScreen, screenSize: screenSize),
          ),
        );
      },
    );
  }

  void backButonPressed() {}

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomePage(),
          const VendorPage(),
          const CatalogPage(),
          const Profile(),
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
