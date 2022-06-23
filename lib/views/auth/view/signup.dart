import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
import 'package:organic/core/constants/color/colorConst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/auth/cubit/auth_cubit.dart';
import 'package:organic/views/auth/state/auth_state.dart';
import 'package:organic/widgets/appbar.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () => context.read<AuthCubit>().changeState(VerificationState()),
              text: 'New Registration',
            ),
            if(!KeyboardService.instance.keyboardchek(context)) SizedBox(height: context.h * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!KeyboardService.instance.keyboardchek(context)) const Text(
                    'It looks like you don’t have an account on this\nnumber. Please let us know some information for a secure service.',
                    style: FontStyles.headline6sgrey,
                  ),
                  if(!KeyboardService.instance.keyboardchek(context)) SizedBox(height: context.h * 0.07),
                  const Text(
                    'Full name',
                    style: FontStyles.headline6sdarkgrey,
                  ),
                  Form(
                      child: SizedBox(
                    height: context.h * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextformFieldWidgets(hintText: 'Fullname'),
                        Text(
                          'Password',
                          style: FontStyles.headline6sdarkgrey,
                        ),
                        TextformFieldWidgets(hintText: 'Password'),
                        Text(
                          'Password confirmation',
                          style: FontStyles.headline6sdarkgrey,
                        ),
                        TextformFieldWidgets(hintText: 'Password confirmation'),
                      ],
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(value: true, onChanged: (v) {}),
                      const Text(
                        'I accept the',
                        style: FontStyles.headline7s,
                      ),
                      const Text(
                        'Terms of use',
                        style: FontStyles.headline7sgreen,
                      ),
                      const Text(
                        'and',
                        style: FontStyles.headline7s,
                      ),
                      const Text(
                        'Privacy policy',
                        style: FontStyles.headline7sgreen,
                      ),
                    ],
                  ),
                  SizedBox(height: context.h * 0.01),
                  Center(child: ButtonWidgets(text: 'Sign up', onPressed: () {})),
                  SizedBox(height: context.h * 0.01),
                  const Center(
                    child: Text(
                      'or use',
                      style: FontStyles.headline6sgrey,
                    ),
                  ),
                  SizedBox(height: context.h * 0.01),
                  Center(
                    child: ButtonWidgets(
                      text: 'Sign up with Google',
                      onPressed: () {},
                      backGroundColor: ColorConst.white,
                      bordercolor: ColorConst.dark,
                      styles: FontStyles.headline4sbolddark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
