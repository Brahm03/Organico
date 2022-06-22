import 'package:flutter/material.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';

class AllStyles {
  static elevetedStyle({TextStyle fontStyles = FontStyles.headline3s,required double height, required double width,required BuildContext context, Color backgroundcolor = ColorConst.kPrimaryColor, Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
        textStyle: fontStyles,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiuConst.extraLarge)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }
  
}
