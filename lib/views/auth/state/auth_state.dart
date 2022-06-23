abstract class AuthState {
  AuthState();
}

class SingInState extends AuthState {
  SingInState();
}

class SignUpState extends AuthState {
  SignUpState();
}

class VerificationState extends AuthState {
  VerificationState();
}

class AutharizationState extends AuthState {
  AutharizationState();
}

class OTACstate extends AuthState {
  OTACstate();
}

class ResetPasswordState extends AuthState {
  ResetPasswordState();
}
