import 'package:flutter/material.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontSize.dart';

class FontStyles {
  static const TextStyle headline1s =
      TextStyle(fontSize: FonstSizeConst.extraLarge);
  static const TextStyle headline2s =
      TextStyle(fontSize: FonstSizeConst.large2);
  static const TextStyle headline3s =
      TextStyle(fontSize: FonstSizeConst.large1);
  static const TextStyle headline4s =
      TextStyle(fontSize: FonstSizeConst.medium2);
  static const TextStyle headline4sbold =
      TextStyle(fontSize: FonstSizeConst.medium2, fontFamily: 'Poppin-bold' , fontWeight: FontWeight.bold);    
  static const TextStyle headline4sbolddark =
      TextStyle(fontSize: FonstSizeConst.medium2, fontFamily: 'Poppin-bold' , fontWeight: FontWeight.bold, color: ColorConst.dark);        
  static const TextStyle headline5s =
      TextStyle(fontSize: FonstSizeConst.medium1);
  static const TextStyle headline5sdarkgrey =
      TextStyle(fontSize: FonstSizeConst.medium1, color: ColorConst.darkGrey);    
  static const TextStyle headline5sbold =
      TextStyle(fontSize: FonstSizeConst.medium1, fontFamily: 'Poppin-bold' , fontWeight: FontWeight.bold);
  static const TextStyle headline6s =
      TextStyle(fontSize: FonstSizeConst.smallmeddium);
  static const TextStyle headline6sdarkgrey =
      TextStyle(fontSize: FonstSizeConst.smallmeddium, color: ColorConst.darkGrey);    
  static const TextStyle headline6sgreen =
      TextStyle(fontSize: FonstSizeConst.smallmeddium, color: ColorConst.green);    
      static const TextStyle headline6sgrey =
      TextStyle(fontSize: FonstSizeConst.smallmeddium, color: ColorConst.grey);    
  static const TextStyle headline7s = TextStyle(fontSize: FonstSizeConst.small);
  static const TextStyle headline7sgreen = TextStyle(fontSize: FonstSizeConst.small, color: ColorConst.green);
  static const TextStyle headline7sthin = TextStyle(fontSize: FonstSizeConst.small, fontFamily: 'Poppin-thin', color: ColorConst.grey);
}
