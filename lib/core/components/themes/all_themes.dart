import 'package:flutter/material.dart';
import 'package:organic/core/constants/color/colorConst.dart';

class Allthemes {
  static final Allthemes _instance = Allthemes.init();
  static Allthemes get instance => _instance;
  Allthemes.init();

  get light => ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppin-regular',
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light, primary: ColorConst.white));

  get dark => ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppin-regular',
      colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark, primary: ColorConst.white));
}
