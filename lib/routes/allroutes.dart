import 'package:flutter/material.dart';
import 'package:organic/views/auth/view/main/auth_main.dart';
import 'package:organic/views/splash/view/splashview.dart';

class AllRoutes {
  static final AllRoutes _instance = AllRoutes.init();
  static AllRoutes get instance => _instance;
  AllRoutes.init();

  Route? ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return pageReturner(const SplashView());
       case '/auth':
        return pageReturner(const AuthMain());
    }
    return null;
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}