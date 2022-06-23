import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/auth/cubit/auth_cubit.dart';
import 'package:organic/views/auth/state/auth_state.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () => context.read<AuthCubit>().changeState(SingInState()),
              text: 'Phone verification',
            ),
            SizedBox(height: context.h * 0.03),
            if(!KeyboardService.instance.keyboardchek(context)) SizedBox(
                height: context.h * 0.4,
                child: Image.asset('assets/images/verification.png')),
            Padding(
              padding: PMconst.medium,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter your phone number',
                      style: FontStyles.headline5sbold,
                    ),
                    SizedBox(height: context.h * 0.02),
                    const Text(
                      'We need to verify you. We will send you a one-time authorization code.',
                      style: FontStyles.headline6sdarkgrey,
                    ),
                    SizedBox(height: context.h * 0.05),
                    IntlPhoneField(
                      decoration: InputDecoration(
                          contentPadding: PMconst.small,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiuConst.extraLarge))),
                    ),
                    SizedBox(height: context.h * 0.05),
                    ButtonWidgets(text: 'Next', onPressed: () => context.read<AuthCubit>().changeState(AutharizationState())),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
