import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/view/cart/cubit/cart_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/orderstatus.dart';

class OrderStatusView extends StatelessWidget {
  final BuildContext newcontext;
  const OrderStatusView({required this.newcontext,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(newcontext);
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
    body: SafeArea(
        child: Column(
      children: [
        AppBarWidget(
          onpressed: () => NavigationService.instance.pop(),
          text: 'Order Status Details',
        ),
        Padding(
          padding: PMconst.medium,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.w * 0.2,
                      height: context.h * 0.6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconStepper(
                          enableNextPreviousButtons: false,
                          stepColor: ColorConst.grey,
                          activeStepColor: ColorConst.kPrimaryColor,
                          direction: Axis.vertical,
                          icons: [
                            IconConst.done,
                            IconConst.done,
                            IconConst.done,
                            IconConst.done,
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: context.h * 0.44,
                        width: context.w * 0.7,
                        child: ListView.builder(itemCount: context.watch<CarCubit>().orderStatusSubTitles.length,itemBuilder: (_, __) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: context.h * 0.038),
                            child: OrderStatusWidget(
                              color: __ == 0 ? ColorConst.grey.withOpacity(0.5) : __ == 1 ? ColorConst.grey.withOpacity(0.5) :  __ == 2 ? ColorConst.whitePink : __ == 3 ? ColorConst.whitePink : ColorConst.white,
                                subtitle: context.watch<CarCubit>().orderStatusSubTitles[__], title: context.watch<CarCubit>().orderStatusTitles[__]),
                          );
                        }))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )),
  );
  }
}
