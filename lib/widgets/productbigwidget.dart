import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';

class ProductBigWidget extends StatelessWidget {
  final Color color;
  final int index;
  final double height;
  final String name;
  final String image_url;
  final String cost;
  final String market;
  const ProductBigWidget(
      {required this.height,
      required this.index,
      required this.color,
      required this.cost,
      required this.image_url,
      required this.market,
       required this.name,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.h * 0.02),
      height: context.h * 0.27,
      width: context.w * 0.47,
      padding: PMconst.small,
      decoration: AllStyles.instance.productStyel(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: height,
              child: Image.asset(image_url)),
          SizedBox(height: context.h * 0.01),
          Text(
            name,
            style: FontStyles.headline5sbold,
          ),
          Text(
            market,
            style: FontStyles.headline6sdarkgrey,
          ),
          SizedBox(height: context.h * 0.02),
          Row(
            children: [
              Text(
                '$cost / Kg',
                style: FontStyles.headline6sbold,
              ),
              const Spacer(),
              IconConst.plus
            ],
          )
        ],
      ),
    );
  }
}
