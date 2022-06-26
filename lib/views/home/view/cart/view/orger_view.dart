import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/service/data_service.dart';
import 'package:organic/views/home/state/homeState.dart';
import 'package:organic/views/home/view/cart/cubit/cart_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/order_list_tile.dart';
import 'package:organic/widgets/text_button.dart';

class OrderView extends StatelessWidget {
  final BuildContext newcontext;
  const OrderView({required this.newcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CarCubit(), child: scafold(context));
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarCubit, MainState>(
        builder: (context, state) => SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                onpressed: () => NavigationService.instance.pop(),
                text: 'My orders',
              ),
              Padding(
                padding: PMconst.medium,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButtonWidget(
                          style: context.watch<CarCubit>().currentpage == 0 ? FontStyles.headline6sred : FontStyles.headline6sgrey,
                          ontap: () {
                            context.read<CarCubit>().changecatog(0);
                          },
                          text: 'Ongoing',
                          current: 0,
                          color: context.watch<CarCubit>().currentpage == 0
                              ? ColorConst.kPrimaryColor
                              : Colors.transparent,
                        ),
                        TextButtonWidget(
                            style: context.watch<CarCubit>().currentpage == 1 ? FontStyles.headline6sred : FontStyles.headline6sgrey,
                            ontap: () {
                              context.read<CarCubit>().changecatog(1);
                            },
                            text: 'History',
                            current: 1,
                            color: context.watch<CarCubit>().currentpage == 1
                                ? ColorConst.kPrimaryColor
                                : Colors.transparent),

                      ],
                    ),
                    Container(
                        height: context.h * 0.3,
                        width: context.w,
                        padding: PMconst.small,
                        decoration: AllStyles.instance
                            .productStyel(color: Colors.transparent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              trailing: const Text('Confirmed', style: FontStyles.headline6sred,),
                              leading: CircleAvatar(
                                backgroundColor: ColorConst.grey,
                                child: IconConst.home,
                              ),
                              title: const Text(
                                "Popey Shop - New York",
                                style: FontStyles.headline5sbold,
                              ),
                            ),
                            SizedBox(height: context.h * 0.02,),
                          Row(
                            children: [
                              OrdersListViewWidget(buildContext: newcontext,imageData: DataService.instance.alldata[0][Random().nextInt(DataService.instance.alldata[0].length)]['image_url']),
                          OrdersListViewWidget(buildContext: newcontext,imageData: DataService.instance.alldata[0][Random().nextInt(DataService.instance.alldata[0].length)]['image_url']),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text('02 Mar 2021', style: FontStyles.headline6sgrey,),
                              const Spacer(),
                              ButtonWidgets(text: 'Details', onPressed: () => NavigationService.instance.pushNamed(routeName: '/orderStatus_view', args: context),width: context.w * 0.4, height: context.h * 0.03,)
                            ],
                          )
                          ],
                        ),
                      ),
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
