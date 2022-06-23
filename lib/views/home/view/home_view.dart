import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/widgets/productbigwidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your Lacation',
                style: FontStyles.headline6sdarkgrey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bandung, Cimahi',
                    style: FontStyles.headline6sbold,
                  ),
                  SizedBox(width: context.w * 0.01),
                  IconConst.dawnarrow
                ],
              ),
              Padding(
                padding: PMconst.medium,
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(RadiuConst.extraLarge),
                          color: CupertinoColors.systemGrey4),
                    ),
                    SizedBox(height: context.h * 0.1),
                    Row(
                      children: [
                        const Text('Choose Category', style: FontStyles.headline6sbold,),
                        const Spacer(),
                        InkWell(onTap: (){},child: Text('See all', style: FontStyles.headline6sdarkgrey,))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
