import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/bordered_container_widget.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/leading_for_listtile_widget.dart';
import 'package:organic/widgets/orders_listview_widget.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';

class StatusView extends StatelessWidget {
  final BuildContext forcontext;
  const StatusView({Key? key, required this.forcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orderScaffold(forcontext);
  }

  Scaffold orderScaffold(BuildContext context) {
    var data = context.watch<HomeCubit>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(
              onpressed: () => NavigationService.instance.pop(),
              text: 'Popey Shop - New York'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: PMconst.small,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Status", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(containerChild: ProfileListTileWidget(
                          title: "Completed",
                          subtitle: const Text("10:25 AM"),
                          trailing: IconConst.rightarrow)),
                    SizedBox(height: context.h * 0.03),
                    Text("Overview", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(
                      height: context.h * 0.3,
                      containerChild: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            itemCount: data.overviewNames.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(data.overviewNames[i],
                                              style: FontStyles.headline5s),
                                          Text(":",
                                              style: FontStyles.headline5s),
                                        ],
                                      )),
                                      SizedBox(width: context.w * 0.03),
                                      Expanded(
                                          child: Text(data.overviewDetails[i],
                                              style: FontStyles.headline5sbold)),
                                    ],
                                  ),
                                  SizedBox(height: context.h * 0.02),
                                ],
                              );
                            },),
                    ),
                    SizedBox(height: context.h * 0.03),
                    Text("Order Summary", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(
                      height: context.h * 0.12,
                      containerChild: OrdersListViewWidget(
                          imageData: data.categoriesList,
                          colorData: data.colorList,
                          itemCount: 2,
                          ),
                      ),
                    SizedBox(height: context.h * 0.03),
                    Text("Delivery", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(
                      containerChild: Column(
                        children: [
                          Row(
                            children: [
                              IconConst.pinlocation,
                              SizedBox(width: context.w * 0.03),
                              Text("4517 Washington Ave. New York 39495",
                                  style: FontStyles.headline6s)
                            ],
                          ),
                          Row(
                            children: [
                              IconConst.locationwhite,
                              SizedBox(width: context.w * 0.03),
                              Text("Home", style: FontStyles.headline5s)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.03),
                    Text("Coupon", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(
                      containerChild: ProfileListTileWidget(
                        title: "Free Shipping",
                        leading: LeadingForListTile(leadingChildColor: ColorConst.whiteGreen, leadingChild: IconConst.cupon),
                      ),
                    ),
                    SizedBox(height: context.h * 0.03),
                    Text("Payment Method", style: FontStyles.headline4sbold),
                    SizedBox(height: context.h * 0.02),
                    BorderedContainerWidget(
                      containerChild: ProfileListTileWidget(
                        title: "Credit Card",
                                                leading: LeadingForListTile(leadingChildColor: ColorConst.whiteGreen, leadingChild: IconConst.creditcard),

                      ),
                    ),
                    SizedBox(height: context.h * 0.03),
                    SizedBox(
                      width: context.w,
                      height: context.h * 0.2,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.totalNames.length,
                        itemBuilder: (context, i){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data.totalNames[i], style: i== 3 ? FontStyles.headline4s : FontStyles.headline5s),
                                Text(data.totalCosts[i], style: i== 3 ? FontStyles.headline4s : FontStyles.headline5s),

                              ],
                            ),
                            SizedBox(height: context.h * 0.02),
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: context.h * 0.03),
                    ButtonWidgets(
                      height: context.h * 0.06,
                      width: context.w,
                      text: "Order again" , onPressed: (){}),
                    SizedBox(height: context.h * 0.03),
                    ButtonWidgets(
                      styles: FontStyles.headline4sboldred,
                      height: context.h * 0.06,
                      width: context.w,
                      backGroundColor: ColorConst.white,
                      bordercolor: ColorConst.kPrimaryColor,
                      text: "Rate Now", onPressed: (){})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}


