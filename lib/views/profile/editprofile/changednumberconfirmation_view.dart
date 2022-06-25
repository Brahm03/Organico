import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class ChangedNumberConfirmationView extends StatelessWidget {
  final BuildContext forcontext;
  const ChangedNumberConfirmationView({Key? key, required this.forcontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return confirmationScaffold(forcontext);
  }

  Scaffold confirmationScaffold(BuildContext context) {
    var data = context.watch<HomeCubit>();
    var dataFonction = context.read<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "OTAC Number",
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: IconConst.leftarrow),
            ),
            SizedBox(height: context.h * 0.05),
            const Padding(
              padding: PMconst.small,
              child: Text(
                  "It looks like you changed your phone number. Please enter the OTAC number that we have sent to your new phone number.",
                  style: FStyles.headline5main),
            ),
            SizedBox(height: context.h * 0.03),
            Padding(
              padding: PMconst.small,
              child: Column(
                children: [
                  MyTextField.textField(
                      text: "6 Digit Code",
                      controller: data.confirmationController),
                  Padding(
                    padding: PMconst.extraSmall,
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: context.h * 0.03,
                      width: context.h,
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Resend Code",
                          style: FStyles.headline5text,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h * 0.03),
                  ElevatedButtonWidget(
                      height: context.h * 0.06,
                      width: context.w,
                      child: const Text("Next"),
                      onPressed: () {
                        NavigationService.instance
                            .pushNamedAndRemoveUntil("/mainview");
                        dataFonction.changeState(ProfileState());
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
