import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class ChangePasswordView extends StatelessWidget {
  final BuildContext forcontext;
  const ChangePasswordView({Key? key, 
  required this.forcontext
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return forgotPasswordScaffold(forcontext);
  }

  Scaffold forgotPasswordScaffold(BuildContext context) {
        var data = context.watch<HomeCubit>();
    var dataFunction = context.read<HomeCubit>();
    return Scaffold(
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(
            text: "Change Password",
            onpressed: (){},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: PMconst.medium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Please fill in the field below to change your current password.",
                        style: FontStyles.headline5s),
                    SizedBox(height: context.h * 0.03),
                    const Text("Current Password",
                        style: FontStyles.headline4s),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return TextformFieldWidgets(
                            hintText: "Current Password",
                            obSecure: data.getShown,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  dataFunction.obSecure();
                                  setState(() {});
                                },
                                iconSize: 40,
                                icon: IconConst.eye));
                      }),
                    ),
                    SizedBox(height: context.h * 0.02),
                    const Text("New Password", style: FontStyles.headline4s),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return TextformFieldWidgets(
                          hintText: "New Password",
                          obSecure: data.getShown,
                          suffixIcon: IconButton(
                              iconSize: 40,
                              onPressed: () {
                                dataFunction.obSecure();
                                setState(() {});
                              },
                              icon: IconConst.eye),
                        );
                      }),
                    ),
                    SizedBox(height: context.h * 0.02),
                    const Text("New Password Confirmation",
                        style: FontStyles.headline4s),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return TextformFieldWidgets(
                          hintText: "New Password Confirmation",
                          obSecure: data.getShown,
                          suffixIcon: IconButton(
                              iconSize: 40,
                              onPressed: () {
                                dataFunction.obSecure();
                                setState(() {});
                              },
                              icon: IconConst.eye),
                        );
                      }),
                    ),
                    SizedBox(height: context.h * 0.04),
                    ButtonWidgets(text: 'text', onPressed: (){}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
