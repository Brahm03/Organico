import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class AddPaymentMethodView extends StatelessWidget {
  final BuildContext forcontext;
  const AddPaymentMethodView({Key? key, required this.forcontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addPaymentscaffold(forcontext);
  }

  Scaffold addPaymentscaffold(BuildContext context) {
    var dataFunction = context.read<HomeCubit>();
    var data = context.watch<HomeCubit>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarWidget(
            text: "Add Payment Method",
            onpressed: (){},
          ),
          Expanded(
              child: Padding(
            padding: PMconst.medium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Method", style: FontStyles.headline4sbold),
                Row(
                  children: [
                    Expanded(
                        child: RadioListTile(
                            title: Text("Credit Card",
                                style: FontStyles.headline5sbold),
                            value: "1",
                            groupValue: dataFunction.groupValue,
                            onChanged: (v) {
                              dataFunction.radioButton(v);
                            })),
                    Expanded(
                        child: RadioListTile(
                            title: Text("PayPal", style: FontStyles.headline5sbold),
                            value: "2",
                            groupValue: dataFunction.groupValue,
                            onChanged: (v) {
                              dataFunction.radioButton(v);
                            })),
                  ],
                ),
                SizedBox(height: context.h * 0.02),
                Text("Details Method", style: FontStyles.headline4sbold),
                SizedBox(height: context.h * 0.02),
                Text("Name", style: FontStyles.headline4s),
                SizedBox(height: context.h * 0.01),
                TextformFieldWidgets(
                    hintText: "Card Holder Name", ),
                SizedBox(height: context.h * 0.02),
                Text("Credit Card Number", style: FontStyles.headline4s),
                SizedBox(height: context.h * 0.01),
                TextformFieldWidgets(
                    hintText: "Credit Card Number",
                    ),
                SizedBox(height: context.h * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CCV",
                              style: FontStyles.headline4s),
                          SizedBox(height: context.h * 0.01),
                          TextformFieldWidgets(
                      hintText: "CCV",
                              ),
                          SizedBox(height: context.h * 0.02),
                        ],
                      ),
                    ),
                    SizedBox(width: context.w * 0.1),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expires",
                              style: FontStyles.headline4s),
                          SizedBox(height: context.h * 0.01),
                          TextformFieldWidgets(
                              hintText: "Expires",
                              ),
                          SizedBox(height: context.h * 0.02),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ),
    floatingActionButton: ButtonWidgets(text: 'text', onPressed: (){})
    );
  }
}
