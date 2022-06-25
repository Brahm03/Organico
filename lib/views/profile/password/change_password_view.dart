import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

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
            leading: IconButton(
                onPressed: () {
                  NavigationService.instance.pop("");
                },
                icon: IconConst.leftarrow),
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
                        style: FStyles.headline5main),
                    SizedBox(height: context.h * 0.03),
                    const Text("Current Password",
                        style: FStyles.headline4text),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return MyTextField.textField(
                            text: "Current Password",
                            controller: data.passwordController,
                            isShown: data.getShown,
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
                    const Text("New Password", style: FStyles.headline4text),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return MyTextField.textField(
                          text: "New Password",
                          controller: data.newpasswordController,
                          isShown: data.getShown,
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
                        style: FStyles.headline4text),
                    SizedBox(height: context.h * 0.01),
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return MyTextField.textField(
                          text: "New Password Confirmation",
                          controller: data.confirmationController,
                          isShown: data.getShown,
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
                    ElevatedButtonWidget(
                        height: context.h * 0.06,
                        width: context.w,
                        child: const Text(
                          "Save Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {}),
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
