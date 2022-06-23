
import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';

class ProductBigWidget extends StatelessWidget {
  final Color color;
  final int index;
  final double height;
  const ProductBigWidget({required this.height,required this.index, required this.color, Key? key})
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
              child: Image.asset(DataService
                  .instance.alldata[1][index]['image_url']
                  .toString())),
          SizedBox(height: context.h * 0.01),
          Text(
            DataService.instance.alldata[0][index]['name'].toString(),
            style: FontStyles.headline5sbold,
          ),
          Text(
            DataService.instance.alldata[1][index]['market'].toString(),
            style: FontStyles.headline6sdarkgrey,
          ),
          SizedBox(height: context.h * 0.02),
          Row(
            children: [
              Text(
                '${DataService.instance.alldata[1][index]['cost']} / Kg',
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
