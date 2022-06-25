import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/home/cubit/home_cubit.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

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
              onpressed: () {},
            ),
            SizedBox(height: context.h * 0.05),
            const Padding(
              padding: PMconst.small,
              child: Text(
                  "It looks like you changed your phone number. Please enter the OTAC number that we have sent to your new phone number.",
                  style: FontStyles.headline6s),
            ),
            SizedBox(height: context.h * 0.03),
            Padding(
              padding: PMconst.small,
              child: Column(
                children: [
                  const TextformFieldWidgets(
                    hintText: "6 Digit Code",
                  ),
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
                          style: FontStyles.headline6s,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h * 0.03),
                  ButtonWidgets(
                      text: 'text',
                      onPressed: () {
                        NavigationService.instance
                            .pushNamedAndRemoveUntil("/mainview");
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
