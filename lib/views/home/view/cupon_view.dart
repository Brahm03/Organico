import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/coupon_list_tile.dart';

class CuponView extends StatelessWidget {
  final BuildContext context1;
  const CuponView({required this.context1, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(context1);
  }

  Scaffold scafold(BuildContext context) {
    var data = context.watch<HomeCubit>();

    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBarWidget(
                  onpressed: () => NavigationService.instance.pop(),
                  text: 'Cupon'),
              Padding(
                padding: PMconst.medium,
                child: SizedBox(
                  height: context.h * 0.8,
                  child: ListView.builder(
                      itemCount: data.cuponssub.length,
                      itemBuilder: (_, __) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: context1.h * 0.02),
                          child: CuponListTileWidget(
                              listTileColor: __ != 3
                                  ? ColorConst.whitePink
                                  : Colors.transparent,
                              leadingColor: ColorConst.whitePink,
                              title: data.cupons[__],
                              subtitle: data.cuponssub[__]),
                        );
                      }),
                ),
              )
            ],
          )),
    );
  }
}
