import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
import 'package:organic/core/components/navigatorService.dart/navigationservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () {},
              text: 'Reset password',
            ),
            Padding(
              padding: PMconst.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please fill in the field below to reset your current password.',
                    style: FontStyles.headline6sdarkgrey,
                  ),
                  SizedBox(height: context.h * 0.08),
                  SizedBox(
                    height: context.h * 0.25,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'New password',
                          style: FontStyles.headline6sbold,
                        ),
                        TextformFieldWidgets(hintText: 'New password', suffixIcon: IconButton(onPressed: (){}, icon: IconConst.eye, splashRadius: RadiuConst.small,),),
                        const Text(
                          'New password Confirmation',
                          style: FontStyles.headline6sbold,
                        ),
                        TextformFieldWidgets(
                            hintText: 'New password Confirmation', suffixIcon: IconButton(onPressed: (){}, icon: IconConst.eye, splashRadius: RadiuConst.small,)),
                      ],
                    )),
                  ),
                  if(!KeyboardService.instance.keyboardchek(context)) SizedBox(height: context.h * 0.05),
                  ButtonWidgets(text: 'Reset password', onPressed: () => NavigationService.instance.pushNamedAndRemoveUntil('/main_view'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
