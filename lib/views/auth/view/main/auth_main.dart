import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/auth/state/auth_state.dart';
import 'package:organic/views/auth/view/authatization_view.dart';
import 'package:organic/views/auth/view/phoneverification.dart';
import 'package:organic/views/auth/view/resetPassword.dart';
import 'package:organic/views/auth/view/signin.dart';
import 'package:organic/views/auth/view/signup.dart';

import '../../cubit/auth_cubit.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AuthCubit(), child: scafold());
  }

  Scaffold scafold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SingInState) {
              return const SingInView();
            } else if (state is SignUpState) {
              return const SignUpView();
            } else if (state is VerificationState) {
              return const PhoneVerificationView();
            } else if (state is AutharizationState) {
              return AutharizationView(onpressed: () => context.read<AuthCubit>().changeState(SignUpState()),);
            } else if (state is OTACstate) {
              return AutharizationView(onpressed: () => context.read<AuthCubit>().changeState(ResetPasswordState()),);
            } else if (state is ResetPasswordState) {
              return const ResetPasswordView();
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
