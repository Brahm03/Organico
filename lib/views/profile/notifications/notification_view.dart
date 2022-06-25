import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Notification",
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: IconConst.leftarrow),
              trailing: IconButton(onPressed: () {
                NavigationService.instance.pushNamed(routeName: '/notificationsettingsview');
              }, icon: IconConst.settings),
            ),
            CouponListTileWidget(
              leadingColor: ColorConst.kPrimaryColor,
              listTileColor: ColorConst.blackPink,
              title: "Order Status",
              leadingChild: IconConst.truckwhite,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Congratulations, your order has been sent. You can check here.",
                      style: FStyles.headline5main),
                  SizedBox(height: context.h * 0.01),
                  Text("25 Feb 2021 06:15 AM", style: FStyles.headline5main),
                ],
              ),
            ),
            Container(height: context.h * 0.02, color: ColorConst.blackPink),
            CouponListTileWidget(
              leadingColor: ColorConst.kPrimaryColor,
              listTileColor: ColorConst.blackPink,
              title: "New Promo",
              leadingChild: IconConst.tagwhite,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "15% discount for all purchases above \$20. Check it now.",
                      style: FStyles.headline5main),
                  SizedBox(height: context.h * 0.01),
                  Text("25 Feb 2021 05:00 AM", style: FStyles.headline5main),
                ],
              ),
            ),
            SizedBox(height: context.h * 0.02),
            CouponListTileWidget(
              leadingColor: ColorConst.kPrimaryColor,
              // listTileColor: ColorConst.blackPink,
              title: "Tips",
              leadingChild: IconConst.mailwhite,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Let’s learn how to maximize the use of vouchers in the application.",
                      style: FStyles.headline5main),
                  SizedBox(height: context.h * 0.01),
                  Text("24 Feb 2021 02:00 PM", style: FStyles.headline5main),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
