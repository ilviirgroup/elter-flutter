import 'package:flutter/material.dart';

import '../view/pages/main_screen/main_screen.dart';
import '../view/pages/welcome_screen.dart';
import 'app_routes.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRouteNames.welcome:
      return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
    case AppRouteNames.main:
    default:
      return MaterialPageRoute(builder: (ctx) => const MainScreen());
  }
}
