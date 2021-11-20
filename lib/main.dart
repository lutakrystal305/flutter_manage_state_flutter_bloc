import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_bloc.dart';
//import 'package:flutter_bloc_manage_state/src/page/home_page.dart';
import 'package:flutter_bloc_manage_state/src/page/signin_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
    ),
    BlocProvider<ApiBloc>(
      create: (_) => ApiBloc(),
    )
  ], child: const MaterialApp(home: LoginPage())));
}
