import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/auth/cubit/auth_cubit.dart';
import 'package:organic/views/auth/state/auth_state.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class AutharizationView extends StatelessWidget {
  final VoidCallback onpressed;
  const AutharizationView({required this.onpressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () =>
                  context.read<AuthCubit>().changeState(VerificationState()),
              text: 'OTAC Number',
            ),
            SizedBox(height: context.h * 0.05),
            const Text(
              'Enter Authorization Code',
              style: FontStyles.headline6sbold,
            ),
            SizedBox(height: context.h * 0.02),
            const Text(
              'We have sent SMS to',
              style: FontStyles.headline6sdarkgrey,
            ),
            SizedBox(
              height: context.h * 0.01,
            ),
            const Text(
              '1+ (XXX) XXX-X120',
              style: FontStyles.headline5sbold,
            ),
            SizedBox(height: context.h * 0.1),
            Padding(
              padding: PMconst.medium,
              child: Column(
                children: [
                  const TextformFieldWidgets(hintText: '6 Digit code'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        'Resend code',
                        style: FontStyles.headline6sgreen,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  if (!KeyboardService.instance.keyboardchek(context))
                    SizedBox(height: context.h * 0.05),
                  ButtonWidgets(text: 'Next', onPressed: onpressed)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
