//import 'package:meta/meta.dart';

//@immutable
class AuthState {
  final String? email;
  final String? pass;
  final int? status;
  final String? err;
  final String? token;

  AuthState({this.email, this.pass, this.status, this.err, this.token});

  AuthState coppyWith(
      {String? email, String? pass, int? status, String? err, String? token}) {
    return AuthState(
      email: email ?? this.email,
      pass: pass ?? this.pass,
      status: status ?? this.status,
      err: err ?? this.err,
      token: token ?? this.token,
    );
  }
}
