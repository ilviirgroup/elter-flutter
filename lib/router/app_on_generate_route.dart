import 'package:elter/utils/app_route_names.dart';
import 'package:elter/view/pages/bottom_navigation_screens/bottom_navigation_screens.dart';
import 'package:elter/view/pages/search/search_page.dart';
import 'package:elter/view/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRouteNames.welcome:
      return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
    case AppRouteNames.search:
      return MaterialPageRoute(builder: (ctx) => const SearchPage());
    case AppRouteNames.home:
    default:
      return MaterialPageRoute(
          builder: (ctx) => const BottomNavigationScreens());
  }
}
