import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_state.dart';
import 'package:flutter_bloc_manage_state/src/model/user_model.dart';
import 'package:flutter_bloc_manage_state/src/repository/auth_http.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState());

  bool isValid(String email, String pass) {
    // ignore: unnecessary_null_comparison
    if (email == null || email.length < 8 || !email.contains('@gmail')) {
      emit(state.coppyWith(status: 201, err: 'Email is invalid syntax!'));
      return false;
    }
    // ignore: unnecessary_null_comparison
    if (pass == null || pass.length < 6) {
      emit(state.coppyWith(status: 201, err: 'Password is invalid syntax!'));
      return false;
    }
    return true;
  }

  void signIn(
    String email,
    String pass,
    Function onSuccess,
    Function(String) onErr,
  ) async {
    // ignore: unused_local_variable

    final postLogin = PostLogin();
    User user = await postLogin.singIn(email, pass, onSuccess, onErr);
    emit(state.coppyWith(
        email: email, pass: pass, status: 200, token: user.token));
  }
}
