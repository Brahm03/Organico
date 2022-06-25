import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

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
            leading: IconButton(onPressed: () {
              NavigationService.instance.pop("");
            }, icon: IconConst.leftarrow),
          ),
          Expanded(
              child: Padding(
            padding: PMconst.medium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Method", style: FStyles.headline4sbold),
                Row(
                  children: [
                    Expanded(
                        child: RadioListTile(
                            title: Text("Credit Card",
                                style: FStyles.headline5bold),
                            value: "1",
                            groupValue: dataFunction.groupValue,
                            onChanged: (v) {
                              dataFunction.radioButton(v);
                            })),
                    Expanded(
                        child: RadioListTile(
                            title: Text("PayPal", style: FStyles.headline5bold),
                            value: "2",
                            groupValue: dataFunction.groupValue,
                            onChanged: (v) {
                              dataFunction.radioButton(v);
                            })),
                  ],
                ),
                SizedBox(height: context.h * 0.02),
                Text("Details Method", style: FStyles.headline4sbold),
                SizedBox(height: context.h * 0.02),
                Text("Name", style: FStyles.headline4text),
                SizedBox(height: context.h * 0.01),
                MyTextField.textField(
                    text: "Card Holder Name", controller: data.nameController),
                SizedBox(height: context.h * 0.02),
                Text("Credit Card Number", style: FStyles.headline4text),
                SizedBox(height: context.h * 0.01),
                MyTextField.textField(
                    text: "Credit Card Number",
                    controller: data.cardNumberController),
                SizedBox(height: context.h * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CCV",
                              style: FStyles.headline4text),
                          SizedBox(height: context.h * 0.01),
                          MyTextField.textField(
                              text: "CCV",
                              controller: data.ccvController),
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
                              style: FStyles.headline4text),
                          SizedBox(height: context.h * 0.01),
                          MyTextField.textField(
                              text: "Expires",
                              controller: data.ccvController),
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
    floatingActionButton: ElevatedButtonWidget(
        height: context.h * 0.06,
        child: Text("Save"),
        onPressed: () {
        }),
    );
  }
}
