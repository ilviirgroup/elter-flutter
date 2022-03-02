import 'package:elter/utils/app_route_names.dart';
import 'package:elter/view/pages/base/page_base.dart';
import 'package:elter/view/pages/base/page_container.dart';
import 'package:elter/view/pages/bottom_navigation_screens/bottom_navigation_screens.dart';
import 'package:elter/view/pages/home/home_screen.dart';
import 'package:elter/view/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRouteNames.welcome:
      return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
    case AppRouteNames.home:
    default:
      return MaterialPageRoute(builder: (ctx) => const BottomNavigationScreens());
  }
}
