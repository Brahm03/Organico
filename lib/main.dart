import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/themes/all_themes.dart';
import 'package:organic/routes/allroutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigatorKey,
          title: 'Organico',
          theme: Allthemes.instance.dark,
          initialRoute: '/splash',
          onGenerateRoute: AllRoutes.instance.ongenerateRoute,
    );
  }
}
