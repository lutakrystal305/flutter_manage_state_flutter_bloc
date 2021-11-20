//import 'package:flutter_bloc_manage_state/src/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_manage_state/src/model/item_cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData {
  //final _authBloc = AuthBloc();
  final client = http.Client();
  Future<List<ItemCart>> fetchApi(String a) async {
    // ignore: avoid_print
    //print('vlxx');
    final url = Uri.parse('http://localhost:8080/products?page=1');
    //final a = _authBloc.state.token;
    // ignore: avoid_print
    //print(a);
    Map<String, String> headers = {'authorization': a};
    final res = await client.get(url, headers: headers);
    if (res.statusCode == 200) {
      // ignore: avoid_print
      print(res.statusCode);
      // ignore: avoid_print
      //print(res.body);
      final parsed = jsonDecode(res.body).cast<Map<String, dynamic>>();
      // ignore: avoid_print
      //print(parsed);
      final data = parsed.map<ItemCart>((x) => ItemCart.fromJson(x)).toList();
      return data;
    } else {
      return [];
    }
  }
}
