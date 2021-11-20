import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_event.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_state.dart';
import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_state.dart';
import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_bloc.dart';
//import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_state.dart';
//import 'package:flutter_bloc_manage_state/src/repository/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final AuthBloc __authBloc = BlocProvider.of<AuthBloc>(context);
    final ApiBloc __apiBloc = BlocProvider.of<ApiBloc>(context);
    // ignore: avoid_print
    print(__authBloc.state.token);
    final token = __authBloc.state.token ?? '';
    __apiBloc.add(Fetch(token));
    //}
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
    final ApiBloc _apiBloc = BlocProvider.of<ApiBloc>(context);

    void onClick(token) {
      // ignore: avoid_print
      print(token);
      _apiBloc.add(Fetch(token));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
            child: BlocBuilder<ApiBloc, CartState>(
                bloc: _apiBloc,
                builder: (context, state) {
                  if (state is CartFetchSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          BlocBuilder<AuthBloc, AuthState>(
                              bloc: _authBloc,
                              builder: (context, state) => ElevatedButton(
                                  onPressed: () => onClick(state.token),
                                  child: const Text('HELOO'))),
                          ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8.0),
                              itemCount: state.carts.length,
                              itemBuilder: (context, index) => SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: ListTile(
                                      title: Text('${state.carts[index].name}'),
                                    ),
                                  ))
                        ],
                      ),
                    );
                  } else {
                    return const Text('Hello');
                  }
                })));
  }
}
