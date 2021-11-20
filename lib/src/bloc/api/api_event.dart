//enum ApiEvent {
//  fetchData,
//}
/*abstract class ApiEvent {
  String payload;
  ApiEvent(this.payload);
}

class Fetch extends ApiEvent {
  Fetch(String token) : super(token);
}*/
import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

// ignore: must_be_immutable
class Fetch extends ApiEvent {
  String token;
  Fetch(this.token);
  @override
  List<Object> get props => [];
}
