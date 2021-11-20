import 'dart:convert';

import 'package:flutter_bloc_manage_state/src/model/user_model.dart';
import 'package:http/http.dart' as http;

class PostLogin {
  final client = http.Client();

  Future<User> singIn(String email, String pass, Function onSuccess,
      Function(String) onErr) async {
    final url = Uri.parse('http://localhost:8080/user/login');
    final res = await http.post(url, body: {'email': email, 'password': pass});

    if (res.statusCode == 200) {
      final parsed = jsonDecode(res.body); //.cast<Map<String, dynamic>>();
      final data = User.fromJson(parsed);
      onSuccess();
      return data;
    } else {
      // ignore: avoid_print
      print(res.statusCode);
      // ignore: avoid_print
      print(jsonDecode(res.body));
      onErr('Signin fail !');
      //throw Exception('Fail Signin');
      return User(email, pass, '', '');
    }
  }
}
