import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';

class ButtonWidgets extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final TextStyle styles;
  final double width;
  final Color backGroundColor;
  final Color bordercolor;
  const ButtonWidgets(
      {this.backGroundColor = ColorConst.kPrimaryColor,
      this.bordercolor = ColorConst.kPrimaryColor,
      required this.text,
      this.styles = FontStyles.headline4sbold,
      this.height = 60,
      required this.onPressed,
      this.width = 350,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AllStyles.elevetedStyle(
          backgroundcolor: backGroundColor,
          borderColor: bordercolor,
          height: height,
          width: width,
          context: context),
      child: Text(text, style: styles,),
    );
  }
}
