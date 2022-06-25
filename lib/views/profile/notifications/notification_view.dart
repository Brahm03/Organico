import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/coupon_list_tile.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              trailing: InkWell(
                child: IconConst.settings,
                onTap: () {
                  NavigationService.instance
                      .pushNamed(routeName: '/notificationsettingsview');
                },
              ),
              text: "Notification",
              onpressed: () => NavigationService.instance.pop(),
            ),
            ProfileListTileWidget(
              title: "Order Status",
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Congratulations, your order has been sent. You can check here.",
                      style: FontStyles.headline5s),
                  SizedBox(height: context.h * 0.01),
                  Text("25 Feb 2021 06:15 AM", style: FontStyles.headline5s),
                ],
              ),
            ),
            Container(height: context.h * 0.02, color: ColorConst.blackPink),
            ProfileListTileWidget(
              title: "New Promo",
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "15% discount for all purchases above \$20. Check it now.",
                      style: FontStyles.headline5s),
                  SizedBox(height: context.h * 0.01),
                  Text("25 Feb 2021 05:00 AM", style: FontStyles.headline4s),
                ],
              ),
            ),
            SizedBox(height: context.h * 0.02),
            CuponListTileWidget(
                leadingColor: ColorConst.kPrimaryColor,
                // listTileColor: ColorConst.blackPink,
                title: "Tips",
                subtitle: ''),
          ],
        ),
      ),
    );
  }
}
