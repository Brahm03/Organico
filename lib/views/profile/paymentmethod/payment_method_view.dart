import 'package:flutter/material.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/components/styles/allstyles.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/routes/allroutes.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/profile_list_tile_widget.dart';

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
            onpressed: (){},
          ),
          Padding(
            padding: PMconst.medium,
            child: Container(
              width: context.w,
              padding: PMconst.small,
              decoration: AllStyles.instance.productStyel(color: ColorConst.blackPink),
              child: ProfileListTileWidget(
                  leading: Container(
                    width: context.w * 0.12,
                    height: context.w * 0.12,
                    padding: PMconst.extraSmall,
                    decoration: AllStyles.instance.productStyel(color: ColorConst.white),
                    child: IconConst.creditcard,
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
              decoration: AllStyles.instance.productStyel(color: ColorConst.green),
              child: ProfileListTileWidget(
                  leading: Container(
                    width: context.w * 0.12,
                    height: context.w * 0.12,
                    padding: PMconst.extraSmall,
                    decoration: AllStyles.instance.productStyel(color: ColorConst.profilemaincolor),
                    child: IconConst.paypal
                  ),
                  title: "PayPal",
                  trailing: IconConst.rightarrow),
            ),
          ),
        ],
      ),
    ),
          
    floatingActionButton: ButtonWidgets(text: 'text', onPressed: () => NavigationService.instance.pushNamed(routeName: "/addpaymentmethodview", args: context))
  );
  }
}
