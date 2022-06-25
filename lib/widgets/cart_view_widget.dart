import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

class CartWidget extends StatelessWidget {
  final int index;
  final BuildContext newcontext;
  const CartWidget({required this.newcontext,required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: context.h * 0.02),
        padding: PMconst.small,
        decoration: AllStyles.instance.productStyel(
            color: newcontext.watch<HomeCubit>().colorList[
                Random().nextInt(newcontext.watch<HomeCubit>().colorList.length)]),
        child: Row(
          children: [
            Image.asset(DataService.instance.alldata[0][index]['image_url'],
                width: 80),
            SizedBox(width: newcontext.w * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DataService.instance.alldata[0][index]['name'],
                    style: FontStyles.headline5sbold),
                Text(
                    "${DataService.instance.alldata[0][index]['howmuch']} Kilogram",
                    style: FontStyles.headline5sbold),
                Text("\$ ${DataService.instance.alldata[0][index]['cost']}",
                    style: FontStyles.headline6sbold),
              ],
            ),
            SizedBox(width: newcontext.w * 0.07),
            SizedBox(
              width: newcontext.w * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      splashRadius: RadiuConst.small,
                      onPressed: () {},
                      icon: IconConst.minus),
                  Expanded(
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "1",
                          style: FontStyles.headline5sbold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      splashRadius: RadiuConst.small,
                      onPressed: () {},
                      icon: IconConst.plus),
                ],
              ),
            )
          ],
        ));
  }
}
