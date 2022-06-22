
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/views/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SingInState());

  bool _obsecured = false;

  get obsecured => _obsecured;

  changeObsecure() {
    _obsecured = !_obsecured;
  }

  changeState(AuthState state) => emit(state);
}
