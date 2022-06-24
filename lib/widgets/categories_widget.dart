import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  final int index;
  const CategoriesWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PMconst.medium,
      child: InkWell(
        onTap: () {
          debugPrint(HomeCubit.randoms.toString());
        },
        child: Container(
            height: context.h * 0.16,
            width: context.w * 0.32,
            decoration: AllStyles.instance
                .productStyel(color: context.watch<HomeCubit>().colorList[index]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(context.watch<HomeCubit>().categoriesList[index],
                      width: 80),
                  SizedBox(height: context.h * 0.01),
                  Text(
                    context.watch<HomeCubit>().categoriesName[index].toString(),
                    style: FontStyles.headline6sbold,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
