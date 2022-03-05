import 'package:elter/router/app_routes.dart';
import 'package:elter/view/pages/bottom_navigation_page/bottom_navigation_page.dart';
import 'package:elter/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRouteNames.welcome:
      return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
    case AppRouteNames.home:
    default:
      return MaterialPageRoute(builder: (ctx) => const BottomNavigationPage());
  }
}
