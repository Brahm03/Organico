import 'package:flutter/material.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final bool showbutton;
  final Widget trailing;
  const AppBarWidget(
      {this.trailing = const SizedBox(),
      this.text = '',
      this.showbutton = true,
      required this.onpressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.07,
      width: context.w,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w * 0.02),
          child: Row(
            children: [
              showbutton ? IconButton(onPressed: onpressed, icon: IconConst.leftarrow) : const SizedBox(),
              SizedBox(
                width: context.w * 0.05,
              ),
              Text(
                text,
                style: FontStyles.headline5sbold,
              ),
              const Spacer(),
              trailing
            ],
          ),
        ),
      ),
    );
  }
}
