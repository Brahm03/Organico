import 'package:flutter/material.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';

class TextformFieldWidgets extends StatelessWidget {
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String hintText;
  final bool obSecure;
  const TextformFieldWidgets({this.obSecure = false,required this.hintText,this.prefixIcon = const SizedBox(),this.suffixIcon = const SizedBox(),Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obSecure,
        decoration: InputDecoration(
            contentPadding: PMconst.small,
            hintStyle: FontStyles.headline6s,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(RadiuConst.extraLarge))));
  }
}
