import 'package:flutter/material.dart';
import 'package:organic/views/auth/view/main/auth_main.dart';
import 'package:organic/views/home/view/cupon_view.dart';
import 'package:organic/views/home/view/info_view.dart';
import 'package:organic/views/home/view/main/main_view.dart';
import 'package:organic/views/home/view/search_view.dart';
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
      case '/main_view':
        return pageReturner(const MainView());
      case '/info_view':
        return pageReturner(InfoView(
          product: args as Map,
        ));
      case '/search_view':
        return pageReturner(SearchView(newcontext: args as BuildContext,));
      case '/cupon_view':
        return pageReturner(CuponView(context1: args as BuildContext,));  
    }
    return null;
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
