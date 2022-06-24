import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/views/home/state/homeState.dart';

class HomeCubit extends Cubit<MainState> {
  HomeCubit() : super(HomeState());

  int currentIndex = 0;

  List categoriesList = [
    'assets/images/broccoli.png',
    'assets/images/banana.png',
    'assets/images/meat.png'
  ];

  List categoriesName = ['Vegetables', 'Fruits', 'Meats'];

  List<Color> colorList = [
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
    ColorConst.whiteblue,
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
  ];

  int kg = 1;

  buymore() {
    kg++;
  }

  int random = Random().nextInt(4);

  static List<int> randoms = List.generate(4, (index) => Random().nextInt(4));

  onStateChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        return emit(HomeState());
      case 1:
        return emit(Explorestate());
      case 2:
        return emit(CartState());
      case 3:
        return emit(ProfileState());
    }
  }
}
