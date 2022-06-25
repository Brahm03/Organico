import 'package:flutter/material.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';

class PaymentMethodView extends StatelessWidget {
  final BuildContext forcontext;
  const PaymentMethodView({Key? key, required this.forcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return paymentMethodScaffold(forcontext);
  }

  Scaffold paymentMethodScaffold(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(
            text: "Payment Method",
            leading: IconButton(
                onPressed: () {
                  NavigationService.instance.pop("");
                },
                icon: IconConst.leftarrow),
          ),
          Padding(
            padding: PMconst.medium,
            child: Container(
              width: context.w,
              padding: PMconst.small,
              decoration: BoxAllDecoration.decor(Colors.transparent,
                  borderColor: ColorConst.mainColor),
              child: ProfileListTileWidget(
                  leading: Container(
                    width: context.w * 0.12,
                    height: context.w * 0.12,
                    padding: PMconst.extraSmall,
                    child: IconConst.creditcard,
                    decoration: BoxOnlyDecoration.decor(ColorConst.whiteGreen,
                        bottomLeft: 10.0,
                        bottomRight: 10.0,
                        topLeft: 10.0,
                        topRight: 10.0),
                  ),
                  title: "Credit Card",
                  trailing: IconConst.rightarrow),
            ),
          ),
          Padding(
            padding: PMconst.medium,
            child: Container(
              width: context.w,
              padding: PMconst.small,
              decoration: BoxAllDecoration.decor(Colors.transparent,
                  borderColor: ColorConst.mainColor),
              child: ProfileListTileWidget(
                  leading: Container(
                    width: context.w * 0.12,
                    height: context.w * 0.12,
                    padding: PMconst.extraSmall,
                    child: IconConst.paypal,
                    decoration: BoxOnlyDecoration.decor(ColorConst.whiteGreen,
                        bottomLeft: 10.0,
                        bottomRight: 10.0,
                        topLeft: 10.0,
                        topRight: 10.0),
                  ),
                  title: "PayPal",
                  trailing: IconConst.rightarrow),
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: ElevatedButtonWidget(
        height: context.h * 0.06,
        child: Text("Add Payment"),
        onPressed: () {
          NavigationService.instance.pushNamed(routeName: "/addpaymentmethodview", args: context);
        }),
  );
  }
}
