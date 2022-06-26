import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';

class OrderStatusWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  final Color color;
  const OrderStatusWidget(
      {this.trailing = const SizedBox(),
      required this.subtitle,
      required this.title,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.08,
      width: context.w * 0.7,
      decoration: AllStyles.instance.productStyel(color: color),
      child: ListTile(
        trailing: trailing,
        subtitle: Text(
          subtitle,
          style: FontStyles.headline6s,
        ),
        title: Text(
          title,
          style: FontStyles.headline5sbold,
        ),
      ),
    );
  }
}
