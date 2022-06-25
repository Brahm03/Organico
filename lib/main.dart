import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/themes/all_themes.dart';
import 'package:organic/routes/allroutes.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
  DataService.instance.getdata();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigatorKey,
          title: 'Organico',
          theme: HomeCubit.dark ? Allthemes.instance.dark : Allthemes.instance.light,
          initialRoute: '/splash',
          onGenerateRoute: AllRoutes.instance.ongenerateRoute,
    );
  }
}
