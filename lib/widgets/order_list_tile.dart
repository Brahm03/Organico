import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

class OrdersListViewWidget extends StatelessWidget {
  final String imageData;
  final BuildContext buildContext;
  const OrdersListViewWidget({
    Key? key,
    required this.buildContext,
    required this.imageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        width: context.w * 0.15,
        height: context.h * 0.08,
        padding: PMconst.extraSmall,
        decoration: AllStyles.instance.productStyel(
          borderradius: RadiuConst.small,
            color: buildContext.watch<HomeCubit>().colorList[
                Random().nextInt(buildContext.watch<HomeCubit>().colorList.length)]),
        child: Image.asset(imageData),
      ),
    );
  }
}
