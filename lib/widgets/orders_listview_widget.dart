import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/extension/size_extension.dart';

class OrdersListViewWidget extends StatelessWidget {
  final List imageData;
  final List colorData;
  final int itemCount;
  const OrdersListViewWidget({
    Key? key,
    required this.imageData,
    required this.colorData,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            width: context.w * 0.2,
            height: context.h * 0.12,
            padding: PMconst.extraSmall,
            decoration: AllStyles.instance.productStyel(color: ColorConst.dark),
            child: Image.asset(imageData[i])),
        );
      },
    );
  }
}
