import 'package:elter/router/app_routes.dart';
import 'package:elter/view/pages/main_screen/main_screen.dart';
import 'package:elter/view/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRouteNames.welcome:
      return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
    case AppRouteNames.main:
    default:
      return MaterialPageRoute(builder: (ctx) => const MainScreen());
  }
}
