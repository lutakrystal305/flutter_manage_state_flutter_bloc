//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_manage_state/src/page/home_page.dart';
//import 'package:flutter_bloc_manage_state/src/page/signup_page.dart';
import 'package:flutter_bloc_manage_state/src/widget/loading_dialog.dart';
import 'package:flutter_bloc_manage_state/src/widget/msg_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _show = false;

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //bloc.fetchData();
    //bloc.stateStream.listen((data) {
    //  debugPrint('hellow');
    //debugPrint(data);
    //});
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
    void _onSignIn() {
      String email = _emailController.text;
      String pass = _passController.text;

      bool check = _authBloc.isValid(email, pass);
      if (check) {
        LoadingDialog.showLoadingDialog(context, "Loading...");
        _authBloc.signIn(email, pass, () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
        }, (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, 'Sign In', msg);
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Login',
                style: TextStyle(color: Colors.green[900], fontSize: 32)),
          ),
          elevation: 0,
          backgroundColor: Colors.green[100],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          color: Colors.green[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: const Color(0xffaaaaaa)),
                      shape: BoxShape.circle,
                      color: Colors.blue[100]),
                  child: const Text('hello world')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Amber food',
                    style: TextStyle(color: Colors.green[900], fontSize: 32)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Hello\nWelcome back!',
                    style: TextStyle(fontSize: 32)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: const InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        controller: _passController,
                        style: const TextStyle(color: Colors.black),
                        obscureText: _show ? false : true,
                        decoration: const InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black54)),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _show = !_show;
                            });
                          },
                          child: _show
                              ? const Text('HIDE',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                              : const Text('SHOW',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)))
                    ],
                  )),
              ElevatedButton(
                onPressed: _onSignIn,
                child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text('SIGN IN',
                        style: TextStyle(fontSize: 24, color: Colors.white70))),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RichText(
                    text: TextSpan(
                        text: "If you don't have account, you can ",
                        style: const TextStyle(
                            fontSize: 16.0, color: Color(0xff666666)),
                        children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                          text: 'Sign up for a new account!',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.blue))
                    ])),
              )*/
            ],
          ),
        ));
  }
}
