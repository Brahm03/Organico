import 'package:flutter/material.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';

class CategoriesWidget extends StatelessWidget {
  final int index;
  const CategoriesWidget({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PMconst.medium,
      child: InkWell(
        child: Container(
          height: context.h * 0.16,
          width: context.w * 0.32,
          decoration: AllStyles.instance.productStyel(color: ColorConst.whitePink),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(DataService.instance.alldata[index].toString(), width: 80),
                SizedBox(height: context.h * 0.01),
                Text(
                  DataService.instance.alldata[index].toString(),
                  style: FontStyles.headline6sbold,
                ),
              ],
            ),
          )),
      ),
    );
  }
}