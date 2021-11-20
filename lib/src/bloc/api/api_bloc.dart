import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_event.dart';
import 'package:flutter_bloc_manage_state/src/bloc/api/api_state.dart';
//import 'package:flutter_bloc_manage_state/src/model/item_cart.dart';
import 'package:flutter_bloc_manage_state/src/repository/fetch_data.dart';

class ApiBloc extends Bloc<ApiEvent, CartState> {
  final _fetchData = FetchData();

  ApiBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(ApiEvent event) async* {
    // ignore: avoid_print
    //print(false);
    if (event is Fetch) {
      // ignore: avoid_print
      //print(true);
      final data = await _fetchData.fetchApi(event.token);
      // ignore: avoid_print
      //print(data);
      yield CartFetchSuccess(data);
    }
  }
}
