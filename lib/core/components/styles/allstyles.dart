import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';

class AllStyles {
  static final AllStyles _instance = AllStyles.init();
  static AllStyles get instance => _instance;
  AllStyles.init();

  elevetedStyle(
      {TextStyle fontStyles = FontStyles.headline3s,
      required double height,
      required double width,
      required BuildContext context,
      Color backgroundcolor = ColorConst.kPrimaryColor,
      Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
        textStyle: fontStyles,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiuConst.extraLarge)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }

  productStyel({Color borderColor = Colors.transparent, required Color color, double borderradius = RadiuConst.large}) {
    return BoxDecoration(
      border: Border.all(color: borderColor, width: 1),
      color: color,
      borderRadius: BorderRadius.circular(borderradius),
    );
  }

  get searchFieldStyle => BoxDecoration(
      borderRadius: BorderRadius.circular(RadiuConst.extraLarge),
      color: CupertinoColors.systemGrey4);
}
