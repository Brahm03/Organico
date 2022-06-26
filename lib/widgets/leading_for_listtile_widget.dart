import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/extension/size_extension.dart';

class LeadingForListTile extends StatelessWidget {
  final Color leadingChildColor;
  final Widget leadingChild;
  const LeadingForListTile({
    Key? key,
    required this.leadingChildColor,
    required this.leadingChild,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.12,
      height: context.h * 0.06,
      padding: PMconst.extraSmall,
      decoration: AllStyles.instance.productStyel(color: Colors.transparent),
      child: leadingChild
    );
  }
}