import 'package:flutter/material.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final int current;
  final Color color;
  final VoidCallback ontap;
  final TextStyle style;
  const TextButtonWidget(
      {required this.color,
      required this.current,
      required this.text,
      required this.ontap,
      required this.style,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: SizedBox(
          width: context.w * 0.3,
          child: Column(
            children: [
               Text(
                text,
                style: style,
              ),
              SizedBox(
                height: context.h * 0.015,
              ),
              Container(
                height: context.h * 0.003,
                color: color,
              )
            ],
          ),
        ));
  }
}
