import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:organic/core/components/keyboardservice/keyboardservice.dart';
import 'package:organic/core/constants/PM/PMconst.dart';
import 'package:organic/core/constants/fonts/fontStyle.dart';
import 'package:organic/core/constants/icons/iconConst.dart';
import 'package:organic/core/constants/radius/radiusConst.dart';
import 'package:organic/extension/size_extension.dart';
import 'package:organic/views/auth/cubit/auth_cubit.dart';
import 'package:organic/views/auth/state/auth_state.dart';
import 'package:organic/widgets/buttonwidgets.dart';
import 'package:organic/widgets/textformfield.dart';

class SingInView extends StatelessWidget {
  final BuildContext contextnew;
  const SingInView({required this.contextnew, Key? key}) : super(key: key);

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext contextnew) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: PMconst.medium,
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!KeyboardService.instance.keyboardchek(contextnew))
                    SizedBox(
                        height: contextnew.h * 0.3,
                        child: Image.asset(
                            'assets/images/Welcome_Illustration.png')),
                  SizedBox(height: contextnew.h * 0.05),
                  const Text(
                    'Welcome',
                    style: FontStyles.headline5sbold,
                  ),
                  SizedBox(height: contextnew.h * 0.01),
                  const Text(
                    'Welcome to Organico Mobile Apps. Please fill in\nthe field below to sign in.',
                    style: FontStyles.headline7sthin,
                  ),
                  SizedBox(height: contextnew.h * 0.05),
                  IntlPhoneField(
                    decoration: InputDecoration(
                        contentPadding: PMconst.small,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(RadiuConst.extraLarge))),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => TextformFieldWidgets(
                      obSecure: contextnew.watch<AuthCubit>().obsecured,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          contextnew.read<AuthCubit>().changeObsecure();
                          setState(() {});
                        },
                        icon: IconConst.eye,
                        splashRadius: RadiuConst.small,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: IconConst.lock,
                        splashRadius: RadiuConst.small,
                      ),
                    ),
                  ),
                  SizedBox(height: contextnew.h * 0.02),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password',
                          style: FontStyles.headline6sgreen,
                        ),
                      )),
                  SizedBox(height: contextnew.h * 0.01),
                  ButtonWidgets(text: 'Sign in', onPressed: () {}),
                  SizedBox(height: contextnew.h * 0.01),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t you have an account?',
                          style: FontStyles.headline7s,
                        ),
                        TextButton(
                          onPressed: () => contextnew.read<AuthCubit>().changeState(VerificationState()),
                          child: const Text(
                            'Sign up',
                            style: FontStyles.headline6sgreen,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
